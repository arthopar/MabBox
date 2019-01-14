//
//  ThermalImpact.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct ThermalImpact: Codable {
    public let highArea: Int
    public let lowArea: Int

    enum CodingKeys: String, CodingKey {
        case highArea = "highArea"
        case lowArea = "lowArea"
    }
}
