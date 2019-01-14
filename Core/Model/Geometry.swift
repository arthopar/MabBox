//
//  Geometry.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Geometry: Codable {
    public let type: String
    public let coordinates: [[[[Double]]]]

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case coordinates = "coordinates"
    }
}
