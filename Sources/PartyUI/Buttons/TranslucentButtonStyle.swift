//
//  TranslucentButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TranslucentButtonStyle<S: Shape>: ButtonStyle {
    var color: Color = .accentColor
    var shape: S
    var useFullWidth: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(color: Color = .accentColor, foregroundStyle: Color = .accentColor, shape: S = RoundedRectangle(cornerRadius: cornerRad.component), useFullWidth: Bool = true) {
        self.color = color
        self.shape = shape
        self.useFullWidth = useFullWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .foregroundStyle(isEnabled ? color : .gray)
            .frame(maxWidth: useFullWidth ? .infinity : nil)
            .padding()
            .contentShape(shape)
            .background(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2), in: shape)
    }
}
