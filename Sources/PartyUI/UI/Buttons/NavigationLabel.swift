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
    
    public init(text: String, icon: String = "", footer: String = "") {
        self.text = text
        self.icon = icon
        self.footer = footer
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            if !icon.isEmpty {
                Image(systemName: icon)
                    .frame(width: 22, height: 22, alignment: .center)
            }
            if footer.isEmpty {
                Text(text)
            } else {
                VStack(alignment: .leading) {
                    Text(text)
                    Text(footer)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .fontWeight(.semibold)
                .foregroundStyle(.tertiary)
                .imageScale(.small)
        }
        .foregroundStyle(Color(.label))
    }
}
