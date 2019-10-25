//
//  RKHTTPBin.swift
//  RestKitUI_Example
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import RestKitUI

enum RKHTTPBinAPI: RestAPIService {
    case testGet
    
    var baseURL: String { return "https://httpbin.org/get" }
}

class RKHTTPBin : RestAPIClient {
    
    func testGet(_ completion: @escaping (String?) -> Void) {
        
        fetch(api: RKHTTPBinAPI.testGet) { data in
            completion((data != nil ? String(data: data!, encoding: .utf8) : nil))
        }
    }
    
}


