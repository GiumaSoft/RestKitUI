//
//  RestAPIError.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

public enum RestAPIError : Error  {
    case invalidURL(String)
    case error(Error)
}

extension RestAPIError : LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .invalidURL(let info):
            return info
        case .error(let error):
            return error.localizedDescription
        }
    }
}

