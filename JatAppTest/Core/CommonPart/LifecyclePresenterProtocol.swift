//
//  LifecyclePresenterProtocol.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Foundation

protocol LifecyclePresenterProtocol {
    func viewWillAppear()
    func viewDidLoad()
    func viewWillDisappear()
    func viewDidAppear()
    func viewDidDisappear()
}

extension LifecyclePresenterProtocol {
    func viewWillAppear() { }
    func viewDidLoad() { }
    func viewWillDisappear() { }
    func viewDidAppear() { }
    func viewDidDisappear() { }
}
