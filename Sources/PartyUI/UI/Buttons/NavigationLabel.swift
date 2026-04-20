//
//  NavigationLabel.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct NavigationLabel: View {
    var text: String
    var icon: String
    
    public init(text: String, icon: String = "") {
        self.text = text
        self.icon = icon
    }
    
    public var body: some View {
        HStack {
            if !icon.isEmpty {
                Image(systemName: icon)
            }
            Text(text)
            Spacer()
            Image(systemName: "chevron.right")
                .fontWeight(.semibold)
                .foregroundStyle(.tertiary)
                .imageScale(.small)
        }
    }
}
