//
//  SignUpPresenter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol SignUpPresenterProtocol: LifecyclePresenterProtocol {
    var router: SignUpRouterProtocol { get }
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    private weak var view: SignUpView?
    private(set) var router: SignUpRouterProtocol

    init(view: SignUpView?,
         router: SignUpRouterProtocol
    ) {
        self.view = view
        self.router = router
    }

}
