//
//  Debug.swift
//  RestKit
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//

import Foundation

enum DisplayMode {
    case verbose
    case normal
}

func Debug(_ items: Any..., mode: DisplayMode = .normal, file: String = #file, line: Int = #line, function: String = #function) {
    #if DEBUG
    if case .verbose = mode {
        print("\n\(file.components(separatedBy: "/").last ?? "")", line, function)
    }
    for item in items { print("\(item) ") }
    #endif
}

func Debug(title: String) {
    #if DEBUG
    print("\n@@@@@@@@@@@ \(title) ::")
    #endif
}

