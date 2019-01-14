//
//  ThermalDataClass.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct ThermalDataClass: Codable {
    public let unit: String
    public let min: Double
    public let max: Double
    public let mean: Double

    enum CodingKeys: String, CodingKey {
        case unit = "unit"
        case min = "min"
        case max = "max"
        case mean = "mean"
    }
}
