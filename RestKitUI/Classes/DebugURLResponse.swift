//
//  CatchURLResponse.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

class DebugURLResponse {
    
    @discardableResult init(_ data: Data?, _ response: URLResponse, file: String = #file, line: Int = #line, function: String = #function) {
        #if DEBUG
        print("\n\(file.components(separatedBy: "/").last ?? "")", line, function)
        print("@@@@@@@@@@@ DebugURLResponse :: ")
        
        guard let response = response as? HTTPURLResponse else {
            print("---\n", "URLResponse different from HTTPURLResponse are not handled")
            return }
        
        print("---\nURL:", response.url ?? "")
        print("---\nStatus Code:", response.statusCode, "(\(HTTPURLResponse.localizedString(forStatusCode: response.statusCode)))")
        print("---")
        for (key, value) in response.allHeaderFields {
            print("Header:", "\(key) = \(value)") }
        
        guard let data = data else { return }
        print("---\nBody:", String(data: data, encoding: .utf8) ?? data as NSData)
        #endif
    }

}
