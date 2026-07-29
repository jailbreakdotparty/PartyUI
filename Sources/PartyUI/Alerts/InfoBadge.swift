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
    var textColor: Color
    var color: Color
    
    public init(text: String, icon: String, textColor: Color = .secondary, color: Color = Color(.quaternarySystemFill)) {
        self.text = text
        self.icon = icon
        self.textColor = color == Color(.quaternarySystemFill) ? textColor : color
        self.color = color == Color(.quaternarySystemFill) ? color : color.opacity(0.2)
    }
    
    public var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
        }
        .font(.callout)
        .foregroundStyle(textColor)
        .padding(8)
        .background(color, in: .capsule)
    }
}
