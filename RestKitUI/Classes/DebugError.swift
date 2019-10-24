//
//  CatchError.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

class DebugError {
    
    @discardableResult required init<T>(_ error: T, file: String = #file, line: Int = #line, function: String = #function) {
        #if DEBUG
        print("\n\(file.components(separatedBy: "/").last ?? "")", line, function)
        print("@@@@@@@@@@@ DebugError ::")
        if let error = error as? DecodingError {
            print("---\n", "Decoding Error")
            switch error {
            case .keyNotFound(let key, let context):
                print("Key '\(key)' not found:", context.debugDescription)
            case .valueNotFound(let value, let context):
                print("Value '\(value)' not found:", context.debugDescription)
            case .typeMismatch(let type, let context):
                print("Type '\(type)' mismatch:", context.debugDescription)
            case .dataCorrupted(let context):
                print(context)
            default:
                break }
            print("")
            return }
        
        if let error = error as? NSError {
            print("---\n", "Generic Error")
            print(error.localizedDescription, error.localizedFailureReason ?? "")
            return }
        
        guard let error = error as? Error else {
            print("---\n", "Error is not handled")
            return }
        
        print("---\n", "Generic Error")
        print(error)
        #endif
    }
}
