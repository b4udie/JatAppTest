//
//  LoginPresenter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol LoginPresenterProtocol: LifecyclePresenterProtocol {
    var router: LoginRouterProtocol { get }
    
    func loginButtonTapped(email: String?, password: String?)
    func signUpButtonTapped()
}

final class LoginPresenter: LoginPresenterProtocol {
    
    private weak var view: LoginView?
    private(set) var router: LoginRouterProtocol
    
    private let authManager: AuthManagerProtocol

    init(view: LoginView?,
         router: LoginRouterProtocol,
         authManager: AuthManagerProtocol
    ) {
        self.view = view
        self.router = router
        self.authManager = authManager
    }
    
    func viewWillAppear() {
        view?.setNavigationBarHidden(true)
    }

    func loginButtonTapped(email: String?, password: String?) {
        view?.setLoginButtonEnabled(false)
        
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty
        else {
            view?.setLoginButtonEnabled(true)
            return router.present(viewController: AlertFactory.alert(message: "Fill all fields"))
        }
        
        authManager.login(email: email, password: password) { [unowned self] result in
            
            switch result {
            case .success:
                self.router.showTextCounterScreen()
            case .failure(let error):
                self.router.present(viewController: AlertFactory.alert(with: error))
            }
            
            self.view?.setLoginButtonEnabled(true)
        }
    }
    
    func signUpButtonTapped() {
        router.showSignUpScreen()
    }
}
