//
//  Channels.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Channels: Codable {
    public let nir: String
    public let narrowRed: String
    public let narrowGreen: String
    public let wideRed: String
    public let wideGreen: String
    public let wideBlue: String

    enum CodingKeys: String, CodingKey {
        case nir = "NIR"
        case narrowRed = "Narrow_Red"
        case narrowGreen = "Narrow_Green"
        case wideRed = "Wide_Red"
        case wideGreen = "Wide_Green"
        case wideBlue = "Wide_Blue"
    }
}
