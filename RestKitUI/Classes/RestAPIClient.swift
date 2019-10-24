//
//  RestAPIClient.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

public protocol SerializableObject { }
extension Array : SerializableObject { }
extension Dictionary : SerializableObject { }

public typealias RestAPIResponse<T: Decodable> = (RestAPIResult<T>?)->()

public enum RestAPIResult<T: Decodable> {
    
    case Decoded(T)
    case Serialized(SerializableObject, String)
    case Encoded(Data)
    
}

public protocol RestAPIClient : APIClient {
    func fetch(api: RestAPIService, completion: @escaping (Data?)->())
    func fetch<T: Decodable>(api: RestAPIService, completion: @escaping RestAPIResponse<T>)
    func catchError(_ error: RestAPIError, _ request: URLRequest?)
    func catchResponse(_ response: URLResponse, _ request: URLRequest, _ data: Data?)
}

// RestAPIClient default method implementation
public extension RestAPIClient {
    func catchError(_ error: RestAPIError, _ request: URLRequest?) { }
    func catchResponse(_ response: URLResponse, _ request: URLRequest, _ data: Data?) { }
}

public extension RestAPIClient {

    private func use(api: RestAPIService) throws -> URLRequest {
        guard let url = URL(string: api.baseURL + api.resourceURI) else {
            throw RestAPIError.invalidURL("\(api.baseURL + api.resourceURI)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = api.method
        api.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.field) }
        request.httpBody = api.body
        return request
    }
    

    func fetch(api: RestAPIService, completion: @escaping (Data?)->()) {
        do {
            let request = try use(api: api)
            call(request: request) { result in
                switch result {
                case .success(let data, let response):
                    self.catchResponse(response, request, data)
                    completion(data)
                    return
                case .failure(let data, let response):
                    self.catchResponse(response, request, data)
                case .error(let error):
                    self.catchError(.error(error), request)
                }
                completion(nil)
            }
        } catch let error as RestAPIError {
            self.catchError(error, nil)
        } catch let error {
            self.catchError(.error(error), nil)
        }
    }
    
    
    func fetch<T: Decodable>(api: RestAPIService, completion: @escaping RestAPIResponse<T>) {
        do {
            let request = try use(api: api)
            call(request: request) { result in
                switch result {
                case .success(let data, _):
                    self.evalFormat(data: data, completion: completion)
                    return
                case .failure(let data, let response):
                    self.catchResponse(response, request, data)
                case .error(let error):
                    self.catchError(.error(error), request)
                }
                completion(nil)
            }
        } catch let error as RestAPIError {
            catchError(error, nil)
        } catch {
            catchError(.error(error), nil)
        }
    }

    private func evalFormat<T: Decodable>(data: Data?, completion: RestAPIResponse<T>) {
        guard let data = data else { return }

        if let string = String(data: data, encoding: .utf8) {
            if let object = try? JSONSerialization.jsonObject(with: data, options: []) {
                do { let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.Decoded(decoded))
                    Debug("@@@@@@@@@@@ RestAPIClient :: ", mode: .verbose)
                    Debug("---\nevalJSON Decoded")
                    return }
                catch { DebugError(error) }
                
                if let object = object as? [String: Any] {
                    completion(.Serialized(object, string))
                    Debug("@@@@@@@@@@@ RestAPIClient :: ", mode: .verbose)
                    Debug("---\nevalJSON Serialized")
                    return
                }

                if let object = object as? [[String: Any]] {
                    completion(.Serialized(object, string))
                    Debug("@@@@@@@@@@@ RestAPIClient :: ", mode: .verbose)
                    Debug("---\nevalJSON Serialized")
                    return
                }
                
            }
        }
        Debug("@@@@@@@@@@@ RestAPIClient :: ", mode: .verbose)
        print("---\nevalJSON Encoded")
        completion(.Encoded(data))
        
    }
    
     
}
