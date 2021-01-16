//
//  CommonRouterProtocol.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol CommonRouter: class {
    var viewController: UIViewController? { get set }
    
    func present(viewController: UIViewController, animated: Bool)
    func push(_ viewController: UIViewController, animated: Bool)
    
    func dismiss(animated: Bool)
    func popToRoot(animated: Bool)
    func popViewController(animated: Bool)
}

extension CommonRouter {
    func push(_ viewController: UIViewController) {
        push(viewController, animated: true)
    }
    
    func present(viewController: UIViewController) {
        present(viewController: viewController, animated: true)
    }
}

class CommonRouterImplementation: CommonRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
            
    var navController: UINavigationController? {
        return viewController?.navigationController
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            self.navController?.pushViewController(viewController, animated: animated)
        }
    }
        
    func present(viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            self.viewController?.present(viewController, animated: animated)
        }
    }
    
    func dismiss(animated: Bool) {
        viewController?.dismiss(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navController?.popToRootViewController(animated: animated)
    }
    
    func popViewController(animated: Bool) {
        navController?.popViewController(animated: animated)
    }
}
