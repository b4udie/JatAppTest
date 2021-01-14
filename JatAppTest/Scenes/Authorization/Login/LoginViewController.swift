//
//  LoginViewController.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit
 
protocol LoginView: class {

}

final class LoginViewController: UIViewController, LoginView {
    
    var presenter: LoginPresenterProtocol!
    var configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
}
