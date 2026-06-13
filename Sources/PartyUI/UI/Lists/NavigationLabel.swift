//
//  NavigationLabel.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct NavigationLabel: View {
    var text: String
    var icon: String
    var footer: String
    var showChevron: Bool
    
    public init(text: String, icon: String = "", footer: String = "", showChevron: Bool = true) {
        self.text = text
        self.icon = icon
        self.footer = footer
        self.showChevron = showChevron
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            if !icon.isEmpty {
                Image(systemName: icon)
                    .frame(width: 22, height: 22, alignment: .center)
            }
            if footer.isEmpty {
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                VStack(alignment: .leading) {
                    Text(text)
                    Text(footer)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            if showChevron {
                Chevron()
            }
        }
        .foregroundStyle(Color(.label))
    }
}

public struct Chevron: View {
    public init() {}
    
    public var body: some View {
        Image(systemName: "chevron.right")
            .fontWeight(.semibold)
            .foregroundStyle(Color(uiColor: .tertiaryLabel))
            .imageScale(.small)
    }
}
