//
//  ResponseDataContainer.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

struct ResponseDataContainer<Data: Decodable>: Decodable {
    let count: Int
    let max: Int
    let fields: Data

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case max = "max"
        case fields = "fields"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decode(Int.self, forKey: .count)
        max = try values.decode(Int.self, forKey: .max)
        fields = try values.decode(Data.self, forKey: .fields)
    }
}
