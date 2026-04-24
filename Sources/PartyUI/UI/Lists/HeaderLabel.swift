//
//  HeaderLabel.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct HeaderLabel: View {
    var text: String
    var icon: String
    
    public init(text: String, icon: String) {
        self.text = text
        self.icon = icon
    }
    
    public var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: width.headerIcon, alignment: .center)
            Text(text)
        }
    }
}
