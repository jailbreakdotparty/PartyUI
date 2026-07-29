//
//  ToolbarLabel.swift
//  PartyUI
//
//  Created by lunginspector on 7/27/26.
//

import SwiftUI

public struct ToolbarLabel: View {
    var label: String
    var icon: String
    
    public init(_ label: String, icon: String) {
        self.label = label
        self.icon = icon
    }
    
    public var body: some View {
        if #available(iOS 19.0, *) {
            Label(label, systemImage: icon)
                .labelStyle(.iconOnly)
        } else {
            Text(label)
        }
    }
}
