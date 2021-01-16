//
//  LoginConfigurator.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Foundation

protocol LoginConfiguratorProtocol {
    func configure(viewController: LoginViewController)
}

final class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(viewController: LoginViewController) {
        let router = LoginRouter(viewController: viewController)
        
        let authManager = AuthManager()
        
        let presenter = LoginPresenter(
            view: viewController,
            router: router,
            authManager: authManager
        )
        
        viewController.presenter = presenter
    }
}
