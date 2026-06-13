//
//  TerminalPlatter.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

var terminalRad: CGFloat {
    if #available(iOS 19.0, *) { return 22 } else { return 14 }
}

public struct TerminalPlatter: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .scrollIndicators(.hidden)
            .frame(height: 250)
            .padding(.horizontal)
            .background(Color(.quaternarySystemFill), in: .rect(cornerRadius: terminalRad))
    }
}
