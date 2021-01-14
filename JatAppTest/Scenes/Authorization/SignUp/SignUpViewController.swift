//
//  SignUpViewController.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit
 
protocol SignUpView: class {

}

final class SignUpViewController: UIViewController, SignUpView {
    
    var presenter: SignUpPresenterProtocol!
    var configurator: SignUpConfiguratorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
}
