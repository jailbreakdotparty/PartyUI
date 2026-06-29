//
//  SheetLabel.swift
//  PartyUI
//
//  Created by lunginspector on 6/29/26.
//

import SwiftUI

public struct CloseSheetLabel: View {
    var label: String
    
    public init(_ label: String = "Done") {
        self.label = label
    }
    
    public var body: some View {
        if #available(iOS 19.0, *) {
            Image(systemName: "xmark")
        } else {
            Text(label)
        }
    }
}
