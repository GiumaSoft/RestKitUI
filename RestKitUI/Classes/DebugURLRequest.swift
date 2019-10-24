//
//  CatchURLRequest.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

class DebugURLRequest {
    
    @discardableResult init(request: URLRequest, file: String = #file, line: Int = #line, function: String = #function) {
        #if DEBUG
        print("\n\(file.components(separatedBy: "/").last ?? "")", line, function)
        print("@@@@@@@@@@@ DebugURLRequest :: ")
        //print("\nURL\n---\n\(request.url?.absoluteString ?? "")")
        
        print("---\nURL:", request.url ?? "")
        print("---\nMethod:", request.httpMethod ?? "")
        print("---")
        if let headers = request.allHTTPHeaderFields {
            for (key, value) in headers {
                print("Header:", "\(key) = \(value)") } }
        
        guard let data = request.httpBody else { return }
        print("---\nBody:", String(data: data, encoding: .utf8) ?? data as NSData)
        #endif
    }
    
}
