//
//  WelcomeSheetRow.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct WelcomeSheetRow: View {
    var title: String
    var icon: String
    var text: String
    
    public init(title: String, icon: String = "", text: String) {
        self.title = title
        self.icon = icon
        self.text = text
    }
    
    public var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 25, alignment: .center)
            VStack(alignment: .leading) {
                Text(title)
                    .lineLimit(1)
                    .fontWeight(.medium)
                Text(text)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
