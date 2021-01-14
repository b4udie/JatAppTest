//
//  SignUpConfigurator.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Foundation

protocol SignUpConfiguratorProtocol {
    func configure(viewController: SignUpViewController)
}

final class SignUpConfigurator: SignUpConfiguratorProtocol {
    
    func configure(viewController: SignUpViewController) {
        let router = SignUpRouter(viewController: viewController)
        
        let presenter = SignUpPresenter(
            view: viewController,
            router: router
        )
        
        viewController.presenter = presenter
    }
}
