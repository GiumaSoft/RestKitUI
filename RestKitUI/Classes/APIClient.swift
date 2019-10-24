//
//  APIClient.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

public enum APIResult {
    case success(Data, URLResponse)
    case failure(Data?, URLResponse)
    case error(Error) }


public protocol APIClient {
    func call(request: URLRequest, completion: @escaping (APIResult)->Void)
}

public extension APIClient {
    
    func call(request: URLRequest, completion: @escaping (APIResult)->Void) {
        var request = request
        request.cachePolicy = .reloadIgnoringLocalCacheData
        session(request: request, completion: completion)
    }
    
    func session(request: URLRequest, completion: @escaping (APIResult)->Void) {
        DebugURLRequest(request: request)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                DebugError(error)
                completion(.error(error!))
                return }
            if let response = response as? HTTPURLResponse, (200...299) ~= response.statusCode {
                DebugURLResponse(data, response)
                completion(.success(data!, response))
                return }
            DebugURLResponse(data, response!)
            completion(.failure(data, response!))
            }.resume()
    }
}
