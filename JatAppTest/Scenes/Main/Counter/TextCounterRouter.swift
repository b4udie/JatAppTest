//
//  TextCounterRouter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import UIKit

protocol TextCounterRouterProtocol: CommonRouter {
    func logoutButtonResolve()
}

final class TextCounterRouter: CommonRouterImplementation, TextCounterRouterProtocol {
    func logoutButtonResolve() {
        if navController?.presentingViewController == nil {
            let module = LoginViewController.instantiateFrom(appStoryboard: .login)
            module.configurator = LoginConfigurator()
            
            let navigationController = UINavigationController(rootViewController: module)
            navigationController.modalPresentationStyle = .fullScreen
            present(viewController: navigationController)
        } else {
            dismiss(animated: true)
        }
    }
}
