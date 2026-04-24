//
//  PlainAlert.swift
//  PartyUI
//
//  Created by lunginspector on 4/21/26.
//

import SwiftUI

public struct PlainAlert: View {
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
                    .foregroundStyle(color)
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
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

