//
//  LatestFlight.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct LatestFlight: Codable {
    public let id: Int
    public let fieldID: Int
    public let code: String
    public let prevCode: String
    public let flightDate: Date
    public let flightNumber: Int
    public let thermalMean: Double
    public let thermalVariance: String?
    public let thermalData: ThermalDataClass
    public let status: String
    public let mosaicsQuality: String?
    public let coverage: Int
    public let stressIncrease: Double
    public let health: Double
    public let weediness: String?
    public let weedinessMode: String?
    public let processingFlightDate: Date
    public let uploadStartDate: Date
    public let uploadPath: String
    public let northEastLongitude: Double
    public let northEastLatitude: Double
    public let southWestLongitude: Double
    public let southWestLatitude: Double
    public let centerLongitude: Double
    public let centerLatitude: Double
    public let released: Bool
    public let reviewStatus: String
    public let tester: String
    public let imageryID: Int
    public let imageryCode: String
    public let gridID: Int
    public let gridName: String
    public let coveredFields: Int
    public let seasonID: Int
    public let hybridPath: String?
    public let soilPath: String
    public let tilesets: [Tileset]
    public let attachments: [String]
    public let channels: Channels
    public let anomalyImpact: [String: Double]
    public let weedImpact: [String: Double]
    public let changeImpact: [String: Double]
    public let thermalImpact: ThermalImpact

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fieldID = "fieldId"
        case code = "code"
        case prevCode = "prevCode"
        case flightDate = "flightDate"
        case flightNumber = "flightNumber"
        case thermalMean = "thermalMean"
        case thermalVariance = "thermalVariance"
        case thermalData = "thermalData"
        case status = "status"
        case mosaicsQuality = "mosaicsQuality"
        case coverage = "coverage"
        case stressIncrease = "stressIncrease"
        case health = "health"
        case weediness = "weediness"
        case weedinessMode = "weedinessMode"
        case processingFlightDate = "processingFlightDate"
        case uploadStartDate = "uploadStartDate"
        case uploadPath = "uploadPath"
        case northEastLongitude = "northEastLongitude"
        case northEastLatitude = "northEastLatitude"
        case southWestLongitude = "southWestLongitude"
        case southWestLatitude = "southWestLatitude"
        case centerLongitude = "centerLongitude"
        case centerLatitude = "centerLatitude"
        case released = "released"
        case reviewStatus = "reviewStatus"
        case tester = "tester"
        case imageryID = "imageryId"
        case imageryCode = "imageryCode"
        case gridID = "gridId"
        case gridName = "gridName"
        case coveredFields = "coveredFields"
        case seasonID = "seasonId"
        case hybridPath = "hybridPath"
        case soilPath = "soilPath"
        case tilesets = "tilesets"
        case attachments = "attachments"
        case channels = "channels"
        case anomalyImpact = "anomalyImpact"
        case weedImpact = "weedImpact"
        case changeImpact = "changeImpact"
        case thermalImpact = "thermalImpact"
    }
}
