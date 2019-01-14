//
//  BaseViewController.swift
//  Common
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

open class BaseViewController<T: BaseViewModel>: UIViewController {
    public var viewModel: T!
    public let disposeBag = DisposeBag()

    open func bindViewModel() {
        bindLoader()
        bindError()
    }

    private func bindLoader() {
        viewModel.isLoading.asDriver()
            .drive(onNext: {[weak self] isLoading in
                isLoading ? self?.showLoader() : self?.hideLoader()
            })
            .disposed(by: disposeBag)
    }

    private func bindError() {
        viewModel.showError.asDriver()
            .filter { $0 != nil }
            .drive(onNext: {[weak self] error in

                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "cancel", style: .cancel) { _ in })
                self?.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }

    func showLoader() {}

    func hideLoader() {}
}
