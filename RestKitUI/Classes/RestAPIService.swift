//
//  RestAPIService.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

public typealias HTTPHeader = (value: String, field: String)

public protocol RestAPIService {
    var baseURL     : String         { get }
    var resourceURI : String         { get }
    var method      : String         { get }
    var headers     : [HTTPHeader]?  { get }
    var body        : Data?          { get }
}

public extension RestAPIService {
    
    var resourceURI : String         { return "" }
    var method      : String         { return "GET" }
    var headers     : [HTTPHeader]?  { return nil }
    var body        : Data?          { return nil }
}
