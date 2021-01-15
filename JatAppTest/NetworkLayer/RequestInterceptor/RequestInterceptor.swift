//
//  RequestInterceptor.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Alamofire

final class RequestInterceptor: SessionDelegate, Alamofire.RequestInterceptor {

    private var retriedRequests: [String: Int] = [:]
    private var tokenRequested: Bool = false
    
    private init() { }
    static let shared = RequestInterceptor()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard !AuthRouter.isAuthRequest(request: urlRequest) else {
            return completion(.success(urlRequest))
        }
            
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + KeychainService.shared.load(with: .token),
                            forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // TODO: - Handle unauthorized error (401)
    }
}

