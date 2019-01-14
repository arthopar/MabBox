//
//  ServerError.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public final class ServerError: ExpressibleByStringLiteral, Error {
    public typealias StringLiteralType = String

    let errorMessage: String
    var code: Int?

    public required init(stringLiteral value: StringLiteralType) {
        errorMessage = value
    }

    public init(error: Error, code: Int?) {
        self.errorMessage = error.localizedDescription
        self.code = code
    }

    public init(message: String, code: Int?) {
        self.errorMessage = message
        self.code = code
    }
}
