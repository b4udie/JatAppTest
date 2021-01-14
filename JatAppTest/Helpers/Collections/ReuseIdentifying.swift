//
//  ReuseIdentifying.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
