//
//  TerminalHeader.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TerminalHeader: View {
    var text: String
    var icon: String
    var color: Color
    var context: String
    
    public init(text: String, icon: String, color: Color = Color(.label), context: String = "") {
        self.text = text
        self.icon = icon
        self.color = color
        self.context = context
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if icon != "showMeProgressPlease" {
                    Image(systemName: icon)
                        .foregroundStyle(color)
                        .frame(width: 22, height: 22, alignment: .center)
                } else {
                    ProgressView()
                        .frame(width: 22, height: 22, alignment: .center)
                        .offset(y: 0.5)
                }
                Text(text)
                    .fontWeight(.medium)
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
