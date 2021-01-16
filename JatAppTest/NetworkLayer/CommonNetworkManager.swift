//
//  CommonNetworkManager.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Alamofire

class CommonNetworkManager: SessionDelegate {
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    let session = Session(interceptor: RequestInterceptor.shared)

}
