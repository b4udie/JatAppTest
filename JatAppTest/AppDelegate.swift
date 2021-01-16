//
//  AppDelegate.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController: UINavigationController
        if KeychainService.shared.load(with: .token) == .emptyLine {
            let module = LoginViewController.instantiateFrom(appStoryboard: .login)
            module.configurator = LoginConfigurator()
            navController = UINavigationController(rootViewController: module)
        } else {
            let module = TextCounterViewController.instantiateFrom(appStoryboard: .counter)
            module.configurator = TextCounterConfigurator()
            navController = UINavigationController(rootViewController: module)
        }
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}
