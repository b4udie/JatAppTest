//
//  AuthorizationManager.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Alamofire

protocol AuthManagerProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, ErrorType>) -> Void)
    func signUp(name: String, email: String, password: String, completion: @escaping (Result<User, ErrorType>) -> Void)
    func logout(completion: @escaping (Result<Void, ErrorType>) -> Void)
}

final class AuthManager: CommonNetworkManager, AuthManagerProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, ErrorType>) -> Void) {
        
        let request = AuthRouter.login(email: email, password: password)
        
        session.request(request).validate().responseDecodable(of: UserModel.self) { response in
            
            switch response.result {
            case .success(let data):
                completion(.success(data.data))
            case .failure(let error):
                completion(.failure(ErrorType(data: response.data, code: error.responseCode)))
            }
        }
    }
    
    func signUp(name: String, email: String, password: String, completion: @escaping (Result<User, ErrorType>) -> Void) {
        
        let request = AuthRouter.signUp(name: name, email: email, password: password)
        
        session.request(request).validate().responseDecodable(of: UserModel.self) { response in
            
            switch response.result {
            case .success(let data):
                completion(.success(data.data))
            case .failure(let error):
                completion(.failure(ErrorType(data: response.data, code: error.responseCode)))
            }
        }
    }
    
    func logout(completion: @escaping (Result<Void, ErrorType>) -> Void) {
        session.request(AuthRouter.logout).validate().response { response in
            
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(ErrorType(data: response.data, code: error.responseCode)))
            }
        }
    }
}
