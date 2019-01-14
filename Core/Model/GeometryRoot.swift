//
//  Geometry.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct GeometryRoot: Codable {
    public let type: String
    public let features: [Feature]

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case features = "features"
    }
}
