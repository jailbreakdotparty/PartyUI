//
//  ButtonLabel.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct ButtonLabel: View {
    var text: String
    var icon: String
    var useImage: Bool
    
    public init(text: String, icon: String, useImage: Bool = false) {
        self.text = text
        self.icon = icon
        self.useImage = useImage
    }
    
    public var body: some View {
        HStack {
            if icon == "showMeProgressPlease" {
                ProgressView()
                    .frame(width: 20, height: 20, alignment: .center)
                    .offset(y: 0.5)
            } else {
                if useImage {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                } else {
                    Image(systemName: icon)
                        .frame(width: 22, height: 22, alignment: .center)
                }
            }
            Text(text)
        }
        .fontWeight(.medium)
    }
}
