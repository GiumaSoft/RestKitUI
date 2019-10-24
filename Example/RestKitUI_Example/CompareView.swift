//
//  CompareView.swift
//  RestKitUI_Example
//
//  Created by Giuseppe Mazzilli on 24/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI

struct CompareView : View {
    @State var rkOutput : String = ""
    @State var afOutput : String = ""
    
    var body : some View {
        VStack {
            Text("RestKitUI")
            TextView(text: $rkOutput)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            Spacer()
            Text("Alamofire")
            TextView(text: $afOutput)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            Spacer()
            Button(action: {
                RKHTTPBin().testGet { string in self.rkOutput = string ?? "" }
                AFHTTPBin().testGet { string in self.afOutput = string ?? "" }
            }) {
                Text("Push")
            }
        }
    }
}

