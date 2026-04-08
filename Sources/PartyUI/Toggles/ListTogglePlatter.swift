//
//  ListTogglePlatter.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct ListTogglePlatter: ViewModifier {
    var backgroundColor: Color
    
    public init(backgroundColor: Color = Color.accentColor) {
        self.backgroundColor = backgroundColor
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 19.0, *) {
            content
                .buttonStyle(.plain)
                .padding()
                .glassEffect(.regular.interactive().tint(backgroundColor.opacity(0.2)), in: .rect(cornerRadius: DesignStyle.defaultComponentRadius))
                .foregroundStyle(Color.accentColor)
                .contentShape(.rect)
        } else {
            content
                .buttonStyle(.plain)
                .padding()
                .background(backgroundColor.opacity(0.2), in: .rect(cornerRadius: DesignStyle.defaultComponentRadius))
                .foregroundStyle(Color.accentColor)
                .buttonBorderShape(.roundedRectangle)
                .contentShape(.rect)
        }
    }
}
