//
//  Router.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public enum Method: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol Router {
    var baseUrl: String { get }
    var parameters: [String: Any]? { get }
    var resource: String { get }
    var method: Method { get }
}

extension Router {
    var baseUrl: String { return "https://api.myjson.com/" }
    var parameters: [String: Any]? { return nil }
    var method: Method { return .get }
}
