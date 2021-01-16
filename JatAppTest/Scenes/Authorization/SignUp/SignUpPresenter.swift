//
//  SignUpPresenter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import UIKit

protocol SignUpPresenterProtocol: LifecyclePresenterProtocol {
    var router: SignUpRouterProtocol { get }
    
    func signUpTapped(name: String?, email: String?, password: String?)
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    private weak var view: SignUpView?
    private(set) var router: SignUpRouterProtocol
    
    private let authManager: AuthManagerProtocol

    init(view: SignUpView?,
         router: SignUpRouterProtocol,
         authManager: AuthManagerProtocol
    ) {
        self.view = view
        self.router = router
        self.authManager = authManager
    }
    
    func viewWillAppear() {
        view?.setNavigationBarHidden(false)
    }
    
    func signUpTapped(name: String?, email: String?, password: String?) {
        view?.setSignUpButtonEnabled(false)
        
        guard let name = name, !name.isEmpty,
              let email = email, !email.isEmpty,
              let password = password, !password.isEmpty
        else {
            view?.setSignUpButtonEnabled(true)
            return router.present(viewController: AlertFactory.alert(message: "Fill all fields"))
        }

        authManager.signUp(name: name, email: email, password: password) { [unowned self] result in
            switch result {
            case .success:
                self.router.showTextCounterScreen()
            case .failure(let error):
                self.router.present(viewController: AlertFactory.alert(with: error))
            }
        }
        
        self.view?.setSignUpButtonEnabled(true)
    }
}
