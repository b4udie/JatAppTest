//
//  TextCounterPresenter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import UIKit

protocol TextCounterPresenterProtocol: LifecyclePresenterProtocol {
    var router: TextCounterRouterProtocol { get }
    var characterOccurancies: [String] { get }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

extension Notification {
    static let logout: String = "logout"
}

final class TextCounterPresenter: TextCounterPresenterProtocol {
    
    private weak var view: TextCounterView?
    private(set) var router: TextCounterRouterProtocol
    private let sandboxManager: SandboxManagerProtocol
    private let authManager: AuthManagerProtocol
    
    private(set) var characterOccurancies: [String] = []
    private var isLogoutProcessStarted: Bool = false
    
    init(view: TextCounterView?,
         router: TextCounterRouterProtocol,
         sandboxManager: SandboxManagerProtocol,
         authManager: AuthManagerProtocol
    ) {
        self.view = view
        self.router = router
        self.sandboxManager = sandboxManager
        self.authManager = authManager
    }
    
    func viewDidLoad() {
        view?.setTableView()
        view?.setRightBarButtonItem(
            item: UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        )
        
        NotificationCenter.default.addObserver(
            forName: Notification.Name(Notification.logout),
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.logoutButtonTapped()
        }
        
        sandboxManager.getText { [unowned self] result in
            switch result {
            case .success(let text):
                self.characterOccurancies = text.charactersCount().map { "\($0.key) - \($0.value)" }
                self.view?.reloadData()
            case .failure(let error):
                self.router.present(viewController: AlertFactory.alert(with: error))
            }
        }
    }
        
    @objc private func logoutButtonTapped() {
        guard !isLogoutProcessStarted else {
            return
        }
        
        isLogoutProcessStarted = true
        
        authManager.logout { [unowned self] result in
            switch result {
            case .success:
                self.router.dismiss(animated: true)
            case .failure(let error):
                self.router.present(viewController: AlertFactory.alert(with: error))
            }
            
            self.isLogoutProcessStarted = false
        }
    }
}

// MARK: - TableView helpers

extension TextCounterPresenter {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TextCounterCell.self)
        cell.configure(characterOccurancies[indexPath.row])
        return cell
    }
}
