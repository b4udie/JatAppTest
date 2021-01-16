//
//  TextCounterCell.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import UIKit

final class TextCounterCell: UITableViewCell {

    @IBOutlet private weak var detailLabel: UILabel!

    func configure(_ text: String) {
        detailLabel.text = text
    }
}

extension TextCounterCell: ReuseIdentifying { }
