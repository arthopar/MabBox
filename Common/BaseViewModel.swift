//
//  BaseViewModel.swift
//  Common
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation
import Core
import RxSwift

open class BaseViewModel {
    public let isLoading = Variable<Bool>(false)
    public let showError = Variable<ServerError?>(nil)

    public init() {}

    public func responseHendler<T>(response: Response<T>) -> T? {
        switch response {
        case .error(let error):
            showError.value = error
        case .success(let data):
            showError.value = nil
            return data
        }

        return nil
    }
}
