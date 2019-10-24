//
//  TextView.swift
//  RestKitUI_Example
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let view = UITextView()
        view.isEditable = false
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        uiView.text = text
    }
    
}
