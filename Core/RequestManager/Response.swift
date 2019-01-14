//
//  Response.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/14/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public enum Response<T> {
    case error(ServerError)
    case success(T?)
}
