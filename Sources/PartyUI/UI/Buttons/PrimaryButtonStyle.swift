//
//  PrimaryButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    var color: Color
    var shape: AnyShape
    var useFullWidth: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(color: Color = .accentColor, foregroundStyle: Color = .accentColor, shape: AnyShape = AnyShape(.rect(cornerRadius: cornerRad.component)), useFullWidth: Bool = true) {
        self.color = color
        self.shape = shape
        self.useFullWidth = useFullWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .foregroundStyle(isEnabled ? Color(.label) : .gray)
            .frame(maxWidth: useFullWidth ? .infinity : nil)
            .padding()
            .contentShape(shape)
            .background(isEnabled ? color : Color(.systemGray).opacity(0.2), in: AnyShape(shape))
    }
}

