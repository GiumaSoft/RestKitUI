//
//  AFHTTPBin.swift
//  RestKitUI_Example
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Alamofire

class AFHTTPBin {
    
    func testGet(completion: @escaping (String?)->Void) {
        
        Alamofire.request("https://httpbin.org/get", method: .get).response { result in
            completion((result.data != nil ? String(data: result.data!, encoding: .utf8) : nil))
        }
        
    }
    
    
}
