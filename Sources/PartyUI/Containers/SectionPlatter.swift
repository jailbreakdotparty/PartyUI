//
//  SectionPlatter.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

// MARK: SectionPlatter
public struct SectionPlatter: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground), in: .rect(cornerRadius: cornerRad.platter))
    }
}

