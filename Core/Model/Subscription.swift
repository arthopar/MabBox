//
//  Subscription.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public struct Subscription: Codable {
    public let id: Int
    public let promoCode: String
    public let isSubscribed: Bool
    public let pricePerAcre: Int
    public let terms: String
    public let season: Season

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case promoCode = "promoCode"
        case isSubscribed = "isSubscribed"
        case pricePerAcre = "pricePerAcre"
        case terms = "terms"
        case season = "season"
    }
}
