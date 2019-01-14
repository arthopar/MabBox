//
//  RestApiManager.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

final class RestApiManager {
    func makeRequest<T: Decodable>(parameters: Router, onCompletion: @escaping ((Response<T>) -> Void)) {
        let urlString = "\(parameters.baseUrl)\(parameters.resource)"
        guard let url = URL(string: urlString) else {
            onCompletion(Response.error(""))

            return
        }

        var request = URLRequest(url: url)
        if parameters.method.rawValue == Method.get.rawValue {
            var urlComponents = URLComponents(string: urlString)
            var queryItems = [URLQueryItem]()
            if let params = parameters.parameters {
                for (key, value) in params {
                    queryItems.append(URLQueryItem(name: key, value: "\(value)"))
                }
                urlComponents?.queryItems = queryItems
                request = URLRequest(url: (urlComponents?.url)!)
            }
        }

        request.httpMethod = parameters.method.rawValue

        // Set the POST body for the request
        if let params = parameters.parameters, parameters.method.rawValue != Method.get.rawValue {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, _, error -> Void in
            guard error == nil else {
                DispatchQueue.main.async { onCompletion(Response.error(ServerError(error: error!, code: (error as NSError?)?.code))) }
                return
            }

            guard data != nil else {
                DispatchQueue.main.async { onCompletion(Response.error(ServerError(stringLiteral: "Response is empty"))) }

                return
            }
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                print("response \(json)")
            }

            let parser = Parser()
            let responseObject: Response<T>
            do {
                let objectResponse: ResponseDataContainer<T> = try parser.parsData(data: data!)
                responseObject = .success(objectResponse.fields)
            } catch {
                print("Parsing error \(error)")
                responseObject = .error(ServerError(error: error, code: 0))
            }

            DispatchQueue.main.async { onCompletion(responseObject) }
        })

        task.resume()
    }
}
