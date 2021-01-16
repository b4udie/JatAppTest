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
        guard request.response?.statusCode == 401 else {
            return completion(.doNotRetry)
        }
        
        guard let url = request.request?.url?.absoluteString else {
            return completion(.doNotRetry)
        }
                
        guard let retryCount = retriedRequests[url] else {
            retriedRequests[url] = 1
            completion(.retryWithDelay(1))
            return
        }
        
        if retryCount <= 2 {
            retriedRequests[url] = retryCount + 1
            completion(.retryWithDelay(1))
        } else {
            removeCachedUrlRequest(url: url)
            
            // MARK: Refresh access token here if u have a refreshToken and retry the request
            // If we haven't the refreshToken, just make a logout

            NotificationCenter.default.post(name: Notification.Name(Notification.logout), object: nil)
            
            completion(.doNotRetry)
        }
    }
    
    private func removeCachedUrlRequest(url: String?) {
        guard let url = url else {
            return
        }
        
        retriedRequests.removeValue(forKey: url)
    }
}

