//
//  FadeAnimation.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

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
