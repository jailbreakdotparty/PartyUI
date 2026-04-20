//
//  PlatterButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 4/17/26.
//

import SwiftUI

public struct PlatterButtonStyle: PrimitiveButtonStyle {
    var shape: AnyShape
    var color: Color
    @Environment(\.isEnabled) private var isEnabled
    
    public init(shape: AnyShape = AnyShape(RoundedRectangle(cornerRadius: DesignStyle.defaultComponentRadius)), color: Color = Color.accentColor) {
        self.shape = shape
        self.color = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        if #available(iOS 19.0, *) {
            configuration.label
                .buttonStyle(.plain)
                .foregroundStyle(color)
                .padding()
                .glassEffect(.regular.interactive().tint(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2)), in: shape)
                .modifier(FadeScaleAnimation())
                .contentShape(shape)
                .simultaneousGesture(TapGesture().onEnded{
                    configuration.trigger()
                })
        } else {
            configuration.label
                .buttonStyle(.plain)
                .foregroundStyle(color)
                .padding()
                .background(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2), in: shape)
                .modifier(FadeScaleAnimation())
                .contentShape(shape)
                .simultaneousGesture(TapGesture().onEnded{
                    configuration.trigger()
                })
        }
    }
}
