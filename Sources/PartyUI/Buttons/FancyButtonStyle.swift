//
//  FancyButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 4/20/26.
//

import SwiftUI

public struct FancyButtonStyle<S: Shape>: PrimitiveButtonStyle {
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
        if #available(iOS 19.0, *) {
            configuration.label
                .buttonStyle(.plain)
                .foregroundStyle(isEnabled ? color : .gray)
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .padding()
                .contentShape(shape)
                .glassEffect(.regular.interactive().tint(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2)), in: AnyShape(shape))
                .onTapGesture(perform: configuration.trigger)
        } else {
            configuration.label
                .buttonStyle(.plain)
                .foregroundStyle(isEnabled ? color : .gray)
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .padding()
                .contentShape(shape)
                .background(isEnabled ? color.opacity(0.2) : Color(.systemGray).opacity(0.2), in: shape)
                .background(.ultraThinMaterial, in: shape)
                .onTapGesture(perform: configuration.trigger)
                .modifier(FadeAnimation())
        }
    }
}

public struct FadeAnimation: ViewModifier {
    @State private var shouldAnimate: Bool = false
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .opacity(shouldAnimate ? 0.8 : 1.0)
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: shouldAnimate)
            .simultaneousGesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            shouldAnimate = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation {
                                    shouldAnimate = false
                                }
                            }
                        }
                    }
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        shouldAnimate = true
                    }
                    .onEnded { _ in
                        withAnimation {
                            shouldAnimate = false
                        }
                    }
            )
    }
}
