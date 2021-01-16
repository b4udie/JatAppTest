//
//  SandboxManager.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import Alamofire

protocol SandboxManagerProtocol {
    func getText(completion: @escaping (Result<String, ErrorType>) -> Void)
}

final class SandboxManager: CommonNetworkManager, SandboxManagerProtocol {
    
    func getText(completion: @escaping (Result<String, ErrorType>) -> Void) {
        let request = SandboxRouter.getText.asURL()
        
        session.request(request).validate().responseDecodable(of: TextModel.self, decoder: decoder) { response in
            
            switch response.result {
            case .success(let data):
                completion(.success(data.data))
            case .failure(let error):
                completion(.failure(ErrorType(data: response.data, code: error.responseCode)))
            }
        }
    }
}
