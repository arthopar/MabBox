//
//  Properties.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Properties: Codable {
    public let fieldID: Int
    public let fieldName: String
    public let token: String

    enum CodingKeys: String, CodingKey {
        case fieldID = "fieldId"
        case fieldName = "fieldName"
        case token = "token"
    }
}
