//
//  AccentBackground.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

// MARK: AccentBackground
public struct AccentBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .background(Color.accentColor.opacity(0.1))
    }
}
