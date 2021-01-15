//
//  ErrorType.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Alamofire

enum ErrorType: Error {
    case authorizationError
    case validationError([ValidationError])
    case generalError([GeneralError])
    case unknownError
    
    init(data: Data?, code: Int?) {
        self = .unknownError
        
        switch code {
        case 401:
            self = .authorizationError
        case 422:
            if let error = try? JSONDecoder().decode(ValidationErrorModel.self, from: data ?? Data()) {
                self = .validationError(error.errors)
            }
        default:
            if let error = try? JSONDecoder().decode(GeneralErrorModel.self, from: data ?? Data()) {
                self = .generalError(error.errors)
            }
        }
    }
}

struct GeneralErrorModel: Codable {
    let errors: [GeneralError]
}

struct GeneralError: Codable {
    let name: String
    let message: String
    let code: Int
    let status: Int
}

struct ValidationErrorModel: Codable {
    let errors: [ValidationError]
}

struct ValidationError: Codable {
    let name: String
    let message: String
}
