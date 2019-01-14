//
//  Field.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Field: Codable {
//    public let id: Int
//    public let farmID: Int
//    public let farmName: String
//    public let divisionID: Int
//    public let divisionName: String
//    public let name: String
//    public let number: String?
//    public let tractName: String?
//    public let description: String?
//    public let area: Double
//    public let token: String
//    public let plantingDate: String?
//    public let thumbnailPath: String
//    public let plantingWeek: String?
    public let geometry: GeometryRoot?
//    public let cropTypes: [String]
//    public let company: Company
    public let latestFlight: LatestFlight?

    public init() {
        geometry = nil
        latestFlight = nil
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latestFlight = try values.decode(LatestFlight.self, forKey: .latestFlight)
        let data = """
{
    "type":"FeatureCollection",
    "features":[
    {
    "geometry":{
    "type":"MultiPolygon",
    "coordinates":[
    [
    [
    [
    -89.17024452820552,
    39.92460619390228
    ],
    [
    -89.16934786067984,
    39.92465855263985
    ],
    [
    -89.16882442532219,
    39.9246794961217
    ],
    [
    -89.16694005803475,
    39.92470742075567
    ],
    [
    -89.16693095481115,
    39.92104919663831
    ],
    [
    -89.16803699647987,
    39.921087595047005
    ],
    [
    -89.1680825125979,
    39.92126911450889
    ],
    [
    -89.16819175128127,
    39.92152044828164
    ],
    [
    -89.16836016091804,
    39.92190093803663
    ],
    [
    -89.16854677700208,
    39.92225000931324
    ],
    [
    -89.16881532209862,
    39.922647948412816
    ],
    [
    -89.16897462851178,
    39.922885314471735
    ],
    [
    -89.16914758976041,
    39.92314711433779
    ],
    [
    -89.16934330906805,
    39.92341240383938
    ],
    [
    -89.16960275094094,
    39.92373354239725
    ],
    [
    -89.16991226054374,
    39.92414543531776
    ],
    [
    -89.17024452820552,
    39.92460619390228
    ]
    ]
    ]
    ]
    },
    "type":"Feature",
    "properties":{
    "fieldName":"Birks Triangle-15",
    "token":"66c53301-f2ff-47c3-8b6b-215434b85593",
    "fieldId":8
    },
    "id":"feature-0"
    }
    ]
}
"""
        let jsonData = data.data(using: .utf8)
        geometry = try JSONDecoder().decode(GeometryRoot.self, from: jsonData!)
    }

    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case farmID = "farmId"
//        case farmName = "farmName"
//        case divisionID = "divisionId"
//        case divisionName = "divisionName"
//        case name = "name"
//        case number = "number"
//        case tractName = "tractName"
//        case description = "description"
//        case area = "area"
//        case token = "token"
//        case plantingDate = "plantingDate"
//        case thumbnailPath = "thumbnailPath"
//        case plantingWeek = "plantingWeek"
        case geometry = "geometry"
//        case cropTypes = "cropTypes"
//        case company = "company"
        case latestFlight = "latestFlight"
    }
}
