//
//  WelcomeSheetBackground.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct WelcomeSheetBackground: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .background(FluidGradientBackground())
            .modifier(AccentBackground())
            .background(colorScheme == .light ? .white : .black)
    }
}
