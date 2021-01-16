//
//  TextCounterConfigurator.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import Foundation

protocol TextCounterConfiguratorProtocol {
    func configure(viewController: TextCounterViewController)
}

final class TextCounterConfigurator: TextCounterConfiguratorProtocol {
    
    func configure(viewController: TextCounterViewController) {
        let router = TextCounterRouter(viewController: viewController)
        
        let sandboxManager = SandboxManager()
        let authManager = AuthManager()
                
        let presenter = TextCounterPresenter(
            view: viewController,
            router: router,
            sandboxManager: sandboxManager,
            authManager: authManager
        )
        
        viewController.presenter = presenter
    }
}
