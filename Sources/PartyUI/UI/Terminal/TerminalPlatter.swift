//
//  TerminalPlatter.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TerminalPlatter: ViewModifier {
    public var isStandaloneView: Bool
    
    public init(isStandaloneView: Bool = false) {
        self.isStandaloneView = isStandaloneView
    }
    
    public func body(content: Content) -> some View {
        content
            .scrollIndicators(.hidden)
            .frame(height: 250)
            .padding(.horizontal)
            .background(Color(.quaternarySystemFill), in: .rect(cornerRadius: 22))
    }
}
