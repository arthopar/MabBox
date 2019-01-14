//
//  Tileset.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Tileset: Codable {
    public let id: Int
    public let name: String
    public let path: String
    public let data: ThermalDataClass?
    public let hidden: Bool
    public let exportGeotiff: String?
    public let exportGeotiffThumbnail: String?
    public let zoomMin: Int
    public let zoomMax: Int
    public let fieldID: Int?
    public let flightID: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case path = "path"
        case data = "data"
        case hidden = "hidden"
        case exportGeotiff = "exportGeotiff"
        case exportGeotiffThumbnail = "exportGeotiffThumbnail"
        case zoomMin = "zoomMin"
        case zoomMax = "zoomMax"
        case fieldID = "fieldId"
        case flightID = "flightId"
    }
}
