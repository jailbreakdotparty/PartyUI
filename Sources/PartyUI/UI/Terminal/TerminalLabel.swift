//
//  TerminalLabel.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TerminalLabel: View {
    var text: String
    var icon: String
    var iconOpacity: CGFloat
    var context: String
    
    public init(text: String, icon: String, iconOpacity: CGFloat = 1.0, context: String = "") {
        self.text = text
        self.icon = icon
        self.iconOpacity = iconOpacity
        self.context = context
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .opacity(iconOpacity)
                Text(text)
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }
            if !context.isEmpty {
                Text(context)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
