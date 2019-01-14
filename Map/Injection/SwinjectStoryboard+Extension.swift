//
//  SwinjectStoryboard+Extension.swift
//  Map
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration
import Core

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.register(FieldsApiManager.self) { _ in
            return FieldsApiServerManager()
        }
        defaultContainer.autoregister(ViewModel.self, initializer: ViewModel.init)
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, controller  in
            controller.viewModel = r.resolve(ViewModel.self)
        }
    }
}
