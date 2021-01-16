//
//  SignUpRouter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol SignUpRouterProtocol: CommonRouter {
    func showTextCounterScreen()
}

final class SignUpRouter: CommonRouterImplementation, SignUpRouterProtocol {
    func showTextCounterScreen() {
        let textCounterModule = TextCounterViewController.instantiateFrom(appStoryboard: .counter)
        
        textCounterModule.configurator = TextCounterConfigurator()
                
        let navController = UINavigationController(rootViewController: textCounterModule)
        navController.modalPresentationStyle = .fullScreen
        present(viewController: navController)
    }
}
