//
//  SmallInfoPlatter.swift
//  PartyUI
//
//  Created by lunginspector on 4/11/26.
//

import SwiftUI

public struct SmallInfoPlatter: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        if #available(iOS 19.0, *) {
            content
                .padding(10)
                .glassEffect(.regular, in: .rect(cornerRadius: DesignStyle.smallPlatterCornerRadius))
        } else {
            content
                .padding(10)
                .background(Color(.quaternarySystemFill), in: .rect(cornerRadius: DesignStyle.smallPlatterCornerRadius))
        }
    }
}
