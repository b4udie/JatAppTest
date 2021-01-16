//
//  AlertFactory.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import UIKit

enum AlertFactory {
    static func alert(with title: String = "Error", message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        return alert
    }
    
    static func alert(with error: ErrorType) -> UIAlertController {
        switch error {
        case .validationError(let validationErrors):
            var message: String = .emptyLine
            
            validationErrors.forEach { error in
                message += error.message + .newLine
            }
            
            return alert(message: message)
        case .generalError(let generalErrors):
            var message: String = .emptyLine
            
            generalErrors.forEach { error in
                message += error.message + .newLine
            }
            
            return alert(message: message)
        default:
            return alert(message: "Unknown error")
        }
    }
    
    
}
