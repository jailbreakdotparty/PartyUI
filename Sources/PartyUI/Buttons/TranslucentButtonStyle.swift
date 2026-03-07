//
//  TranslucentButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TranslucentButtonStyle: PrimitiveButtonStyle {
    var color: Color = .accentColor
    var foregroundStyle: Color
    var shape: AnyShape
    var useFullWidth: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(color: Color = .accentColor, foregroundStyle: Color = .accentColor, shape: AnyShape = AnyShape(.rect(cornerRadius: DesignStyle.defaultComponentRadius)), useFullWidth: Bool = true) {
        self.color = color
        // if a different foreground color is passed, then it'll switch to that color. otherwise it'll go with the same color as the accent color.
        if foregroundStyle == .accentColor {
            self.foregroundStyle = color
        } else {
            self.foregroundStyle = foregroundStyle
        }
        self.shape = shape
        self.useFullWidth = useFullWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        if #available(iOS 19.0, *) {
            configuration.label
                .buttonStyle(.plain)
                .fontWeight(.medium)
                .foregroundStyle(isEnabled ? foregroundStyle : .gray)
                .padding()
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .glassEffect(.regular.interactive().tint(isEnabled ? color.opacity(0.2) : Color(.systemGray5)), in: shape)
                .contentShape(shape)
                .simultaneousGesture(TapGesture().onEnded{
                    configuration.trigger()
                })
        } else {
            configuration.label
                .buttonStyle(.plain)
                .fontWeight(.medium)
                .foregroundStyle(isEnabled ? foregroundStyle : .gray)
                .padding()
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .background(isEnabled ? color.opacity(0.2) : Color(.systemGray5))
                .background(.ultraThinMaterial.opacity(0.6))
                .clipShape(shape)
                .modifier(FadeScaleAnimation())
                .contentShape(shape)
                .simultaneousGesture(TapGesture().onEnded{
                    configuration.trigger()
                })
        }
    }
}
