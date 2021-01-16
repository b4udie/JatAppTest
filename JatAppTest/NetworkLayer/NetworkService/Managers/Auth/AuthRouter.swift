//
//  AuthRouter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Alamofire

enum AuthRouter: CaseIterable, APIConfiguration {
    // MARK: - all cases that not needed access token
    static var allCases: [AuthRouter] {
        return [
            .signUp(name: .emptyLine, email: .emptyLine, password: .emptyLine),
            .login(email: .emptyLine, password: .emptyLine)
        ]
    }

    case login(email: String, password: String)
    case signUp(name: String, email: String, password: String)
    case logout
        
    var method: HTTPMethod {
        switch self {
        case .login, .signUp, .logout:
            return .post
        }
    }

    var path: String {
        switch self {
        case .login:
            return "login/"
        case .signUp:
            return "signup/"
        case .logout:
            return "logout/"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .login(let email, let password):
            return .body([
                "email": email,
                "password": password
            ])
        case .signUp(let name, let email, let password):
            return .body([
                "name": name,
                "email": email,
                "password": password
            ])
        case .logout:
            return .body([:])
        }
    }
    
    static func isAuthRequest(request: URLRequest) -> Bool {
        let authSign = Self.allCases.map { $0.path }
            
        if let urlString = request.url?.absoluteString {
            return authSign.first(where: { urlString.contains($0) }) != nil
        }
        
        return false
    }
}
