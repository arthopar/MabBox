//
//  Feature.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Feature: Codable {
    public let type: String
    public let geometry: Geometry
    public let properties: Properties
    public let id: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case geometry = "geometry"
        case properties = "properties"
        case id = "id"
    }
}
