//
//  SandboxRouter.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import Alamofire

enum SandboxRouter: APIConfiguration {

    case getText
        
    var method: HTTPMethod {
        switch self {
        case .getText:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getText:
            return "get/text/"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getText:
            return .url([:])
        }
    }
}
