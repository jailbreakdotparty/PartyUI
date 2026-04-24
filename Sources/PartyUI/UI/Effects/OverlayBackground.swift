//
//  OverlayBackground.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct OverlayBackground: ViewModifier {
    var stickBottomPadding: Bool
    @State private var keyboardShown: Bool = false
    
    public init(stickBottomPadding: Bool = false) {
        self.stickBottomPadding = stickBottomPadding
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .padding(.top, 25)
            .padding(.bottom, keyboardShown || stickBottomPadding ? 20 : 0)
            .background(VariableBlurView(maxBlurRadius: 10, direction: .blurredBottomClearTop).ignoresSafeArea())
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                keyboardShown = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                keyboardShown = false
            }
    }
}
