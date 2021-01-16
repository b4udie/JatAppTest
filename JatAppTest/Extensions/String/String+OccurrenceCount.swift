//
//  String+OccurrenceCount.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import Foundation

extension String {
    func charactersCount() -> [Character: Int] {
        return self.reduce(into: [:], { $0[$1, default: 0] += 1 })
    }
}
