//
//  LoginPresenter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol LoginPresenterProtocol: LifecyclePresenterProtocol {
    var router: LoginRouterProtocol { get }
}

final class LoginPresenter: LoginPresenterProtocol {
    
    private weak var view: LoginView?
    private(set) var router: LoginRouterProtocol

    init(view: LoginView?,
         router: LoginRouterProtocol
    ) {
        self.view = view
        self.router = router
    }

}
