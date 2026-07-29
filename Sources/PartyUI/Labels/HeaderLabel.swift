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
        if #available(iOS 19.0, *) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .frame(width: 22, alignment: .center)
                Text(text)
            }
        } else {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .frame(width: 18, alignment: .center)
                Text(text)
            }
        }
    }
}
