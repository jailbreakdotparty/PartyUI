//
//  GetButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 6/13/26.
//

import SwiftUI

public struct GetButtonStyle: ButtonStyle {
    var color: Color
    @Environment(\.isEnabled) private var isEnabled
    
    public init(color: Color = .accentColor) {
        self.color = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.footnote)
            .fontWeight(.medium)
            .padding(8)
            .background(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2), in: .capsule)
    }
}
