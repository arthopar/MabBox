//
//  Parser.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

final class Parser {
    func parsData<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode(T.self, from: data)
    }
}
