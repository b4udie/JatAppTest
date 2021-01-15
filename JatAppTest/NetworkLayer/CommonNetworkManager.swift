//
//  CommonNetworkManager.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Alamofire

class CommonNetworkManager: SessionDelegate {
    
    let session = Session(interceptor: RequestInterceptor.shared)

}
