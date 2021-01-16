//
//  SignUpViewController.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit
 
protocol SignUpView: class {
    func setNavigationBarHidden(_ isHidden: Bool)
    func setSignUpButtonEnabled(_ isEnabled: Bool)
}

final class SignUpViewController: UIViewController, SignUpView {
    
    var presenter: SignUpPresenterProtocol!
    var configurator: SignUpConfiguratorProtocol!
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    func setNavigationBarHidden(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    func setSignUpButtonEnabled(_ isEnabled: Bool) {
        signUpButton.isEnabled = isEnabled
    }
    
    @IBAction private func signUpTapped(_ sender: UIButton) {
        presenter.signUpTapped(
            name: nameTextField.text,
            email: emailTextField.text,
            password: passwordTextField.text
        )
    }
}
