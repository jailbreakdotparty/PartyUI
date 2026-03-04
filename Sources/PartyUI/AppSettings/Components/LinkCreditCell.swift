//
//  LinkCreditCell.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct LinkCreditCell: View {
    var image: Image
    var name: String
    var description: String
    var url: String
    @Environment(\.openURL) var openURL
    
    public init(image: Image, name: String, description: String, url: String = "") {
        self.image = image
        self.name = name
        self.description = description
        self.url = url
    }
    
    public var body: some View {
        Button(action: {
            if !url.isEmpty { openURL(URL(string: url)!) }
        }) {
            HStack(spacing: DesignStyle.creditCellSpacing) {
                LinkCreditIcon(image: image)
                VStack(alignment: .leading) {
                    Text(name)
                        .fontWeight(.semibold)
                    Text(description)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if !url.isEmpty {
                    Spacer()
                    Image(systemName: "chevron.right")
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                        .imageScale(.small)
                }
            }
        }
        .foregroundStyle(Color(.label))
    }
}

