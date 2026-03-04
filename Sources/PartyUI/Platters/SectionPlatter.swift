//
//  SectionPlatter.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public enum SectionBackgroundTypes: String, CaseIterable {
    case systemBackground, clear, material
    
    public var sectionBackground: AnyView {
        switch self {
        case .systemBackground: return AnyView(RoundedRectangle(cornerRadius: DesignStyle.platterCornerRadius).fill(Color(.secondarySystemBackground)))
        case .clear: return AnyView(RoundedRectangle(cornerRadius: DesignStyle.platterCornerRadius).fill(Color(.systemFill).opacity(0.7)))
        case .material: return AnyView(RoundedRectangle(cornerRadius: DesignStyle.platterCornerRadius).fill(.ultraThinMaterial))
        }
    }
}

// MARK: SectionPlatter
public struct SectionPlatter: ViewModifier {
    var backgroundType: SectionBackgroundTypes
    
    public init(backgroundType: SectionBackgroundTypes = .systemBackground) {
        self.backgroundType = backgroundType
    }
    
    public func body(content: Content) -> some View {
        content
            .padding()
            .background(backgroundType.sectionBackground)
            .clipShape(.rect(cornerRadius: DesignStyle.platterCornerRadius))
    }
}

