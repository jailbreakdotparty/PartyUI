//
//  InfoBadge.swift
//  PartyUI
//
//  Created by lunginspector on 4/22/26.
//

import SwiftUI

public struct InfoBadge: View {
    var text: String
    var icon: String
    var color: Color
    
    public init(text: String, icon: String, color: Color) {
        self.text = text
        self.icon = icon
        self.color = color
    }
    
    public var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
            Text(text)
        }
        .foregroundStyle(color)
        .padding(10)
        .background(color.opacity(0.2), in: .capsule)
    }
}
