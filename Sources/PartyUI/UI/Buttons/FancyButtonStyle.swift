//
//  FancyButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 4/20/26.
//

import SwiftUI

public struct FancyButtonStyle: PrimitiveButtonStyle {
    var color: Color = .accentColor
    var shape: Shape
    var useFullWidth: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(color: Color = .accentColor, foregroundStyle: Color = .accentColor, shape: Shape = .rect(cornerRadius: cornerRad.component), useFullWidth: Bool = true) {
        self.color = color
        self.shape = shape
        self.useFullWidth = useFullWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        if #available(iOS 19.0, *) {
            configuration.label
                .buttonStyle(.plain)
                .foregroundStyle(isEnabled ? color : .gray)
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .padding()
                .glassEffect(.regular.interactive().tint(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2)), in: AnyShape(shape))
                .onTapGesture(perform: configuration.trigger)
        } else {
            configuration.label
                .buttonStyle(.plain)
                .foregroundStyle(isEnabled ? color : .gray)
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .padding()
                .background(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2), in: AnyShape(shape))
                .background(.ultraThinMaterial, in: AnyShape(shape))
                .brightness(0.1)
                .onTapGesture(perform: configuration.trigger)
                .modifier(FadeAnimation())
        }
    }
    
}

