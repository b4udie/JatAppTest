//
//  SandboxRouter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import Alamofire

enum SandboxRouter: APIConfiguration {

    case getText
    case getPerson
        
    var method: HTTPMethod {
        switch self {
        case .getText, .getPerson:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getText:
            return "get/text/"
        case .getPerson:
            return "get/person/"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getText, .getPerson:
            return .url([:])
        }
    }
}
