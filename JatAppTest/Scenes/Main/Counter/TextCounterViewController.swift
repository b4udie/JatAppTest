//
//  TextCounterViewController.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import UIKit
 
protocol TextCounterView: class {
    func setTableView()
    func reloadData()
    func setRightBarButtonItem(item: UIBarButtonItem)
}

final class TextCounterViewController: UIViewController, TextCounterView {
    
    var presenter: TextCounterPresenterProtocol!
    var configurator: TextCounterConfiguratorProtocol!
    
    @IBOutlet private weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: TextCounterCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setRightBarButtonItem(item: UIBarButtonItem) {
        navigationItem.rightBarButtonItem = item
    }
}

// MARK: - TableView delegate and dataSource

extension TextCounterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.characterOccurancies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.tableView(tableView, cellForRowAt: indexPath)
    }
}
