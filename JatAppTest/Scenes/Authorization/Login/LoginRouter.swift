//
//  LoginRouter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol LoginRouterProtocol: CommonRouter {
    func showTextCounterScreen()
    func showSignUpScreen()
}

class LoginRouter: CommonRouterImplementation, LoginRouterProtocol {
    func showTextCounterScreen() {
        let textCounterModule = TextCounterViewController.instantiateFrom(appStoryboard: .counter)
        
        textCounterModule.configurator = TextCounterConfigurator()
        
        let navController = UINavigationController(rootViewController: textCounterModule)
        navController.modalPresentationStyle = .fullScreen
        present(viewController: navController)
    }
    
    func showSignUpScreen() {
        let signUpModule = SignUpViewController.instantiateFrom(appStoryboard: .signUp)
        
        signUpModule.configurator = SignUpConfigurator()
        
        push(signUpModule)
    }
}
