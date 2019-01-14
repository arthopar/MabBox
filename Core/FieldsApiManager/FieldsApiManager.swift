//
//  FieldsApiManager.swift
//  Core
//
//  Created by Artak Tsatinyan on 1/14/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation

public protocol FieldsApiManager {
    func makeRequest(parameters: FieldsRouter, onCompletion: @escaping ((Response<[Field]>) -> Void))
}
