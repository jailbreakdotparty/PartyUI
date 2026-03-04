//
//  WelcomeSheetRow.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct WelcomeSheetRow: View {
    var icon: String
    var title: String
    var context: String
    
    public init(icon: String = "", title: String, context: String) {
        self.icon = icon
        self.title = title
        self.context = context
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
                Text(context)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
