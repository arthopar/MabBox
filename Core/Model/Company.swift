//
//  Company.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Company: Codable {
    public let id: Int
    public let name: String
    public let address1: String?
    public let address2: String?
    public let state: String?
    public let city: String?
    public let zip: String?
    public let country: String?
    public let phoneNumber: String?
    public let enabled: Bool
    public let climateEnabled: Bool
    public let heardFrom: String?
    public let isJDConnected: Bool
    public let isClimateConnected: Bool
    public let isSpensaConnected: Bool
    public let subscription: Subscription

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address1 = "address1"
        case address2 = "address2"
        case state = "state"
        case city = "city"
        case zip = "zip"
        case country = "country"
        case phoneNumber = "phoneNumber"
        case enabled = "enabled"
        case climateEnabled = "climateEnabled"
        case heardFrom = "heardFrom"
        case isJDConnected = "isJDConnected"
        case isClimateConnected = "isClimateConnected"
        case isSpensaConnected = "isSpensaConnected"
        case subscription = "subscription"
    }
}
