//
//  CompactAlert.swift
//  PartyUI
//
//  Created by lunginspector on 4/5/26.
//

import SwiftUI

public struct CompactAlert: View {
    var title: String
    var icon: String
    var text: String
    var color: Color
    
    public init(title: String = "", icon: String = "", text: String, color: Color = Color.accentColor) {
        self.title = title
        self.icon = icon
        self.text = text
        self.color = color
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            if !icon.isEmpty {
                Image(systemName: icon)
                    .imageScale(.large)
            }
            VStack(alignment: .leading) {
                if !title.isEmpty {
                    Text(title)
                        .fontWeight(.medium)
                }
                Text(text)
                    .font(!title.isEmpty ? .subheadline : .body)
            }
        }
        .foregroundStyle(color)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.2), in: .rect(cornerRadius: cornerRad.platter))
    }
}
