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
        if #available(iOS 19.0, *) {
            content
                .scrollIndicators(.hidden)
                .frame(height: 250)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        VariableBlurView(maxBlurRadius: 1, direction: .blurredTopClearBottom)
                            .frame(height: 18)
                        Spacer()
                        VariableBlurView(maxBlurRadius: 1, direction: .blurredBottomClearTop)
                            .frame(height: 18)
                    }
                    .clipShape(.rect(cornerRadius: isStandaloneView ? DesignStyle.platterCornerRadius : 20))
                }
                .glassEffect(.regular, in: .rect(cornerRadius: isStandaloneView ? DesignStyle.platterCornerRadius : 24))
        } else {
            content
                .scrollIndicators(.hidden)
                .frame(height: 250)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        VariableBlurView(maxBlurRadius: 1, direction: .blurredTopClearBottom)
                            .frame(height: 18)
                        Spacer()
                        VariableBlurView(maxBlurRadius: 1, direction: .blurredBottomClearTop)
                            .frame(height: 18)
                    }
                    .clipShape(.rect(cornerRadius: DesignStyle.platterCornerRadius))
                }
                .background(Color(.quaternarySystemFill), in: .rect(cornerRadius: DesignStyle.platterCornerRadius))
        }
    }
}
