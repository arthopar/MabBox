//
//  Season.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Season: Codable {
    public let id: Int
    public let name: String
    public let startDate: String
    public let endDate: String
    public let country: String
    public let isDefault: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case startDate = "startDate"
        case endDate = "endDate"
        case country = "country"
        case isDefault = "isDefault"
    }
}
