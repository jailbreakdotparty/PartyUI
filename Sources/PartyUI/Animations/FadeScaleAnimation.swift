//
//  FadeScaleAnimation.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct FadeScaleAnimation: ViewModifier {
    @State private var shouldAnimate: Bool = false
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(shouldAnimate ? 0.95 : 1)
            .opacity(shouldAnimate ? 0.6 : 1.0)
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: shouldAnimate)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { changed in
                        shouldAnimate = true
                    }
                    .onEnded { ended in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                shouldAnimate = false
                            }
                        }
                    }
            )
    }
}
