//
//  AppStoryboard.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

enum AppStoryboard: String {
    
    case login = "Login"
    case signUp = "SignUp"
    case counter = "Counter"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
