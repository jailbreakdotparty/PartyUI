//
//  ToolbarButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct SolariumButtonTint: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        if #available(iOS 19.0, *) {
            content
                .tint(Color(.label))
        } else {
            content
        }
    }
}

