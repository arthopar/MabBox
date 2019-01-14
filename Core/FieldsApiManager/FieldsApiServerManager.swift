//
//  FieldsApiServerManager.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/14/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public class FieldsApiServerManager: FieldsApiManager {
    private let apiManager = RestApiManager()

    public init () {}

    public func makeRequest(parameters: FieldsRouter, onCompletion: @escaping ((Response<[Field]>) -> Void)) {
        apiManager.makeRequest(parameters: parameters) { (response: Response<[Field]>) in
            onCompletion(response)
        }
    }
}
