//
//  LoginViewController.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit
 
protocol LoginView: class {
    func setNavigationBarHidden(_ isHidden: Bool)
    func setLoginButtonEnabled(_ isEnabled: Bool)
}

final class LoginViewController: UIViewController, LoginView {
    
    var presenter: LoginPresenterProtocol!
    var configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        
        #if DEBUG
        emailTextField.text = "tertert@rwer.try"
        passwordTextField.text = "teeter teeter"
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    func setNavigationBarHidden(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    func setLoginButtonEnabled(_ isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
    
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        presenter.loginButtonTapped(email: emailTextField.text, password: passwordTextField.text)
    }
    
    @IBAction private func signUpButtonTapped(_ sender: UIButton) {
        presenter.signUpButtonTapped()
    }
}
