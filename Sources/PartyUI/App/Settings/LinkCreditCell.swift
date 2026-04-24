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
            HStack(spacing: spacing.creditCell) {
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

// icon for credits cell
public struct LinkCreditIcon: View {
    var image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    public var body: some View {
        if #available(iOS 19.0, *) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Color(.systemGray6))
                .clipShape(.capsule)
                .glassEffect(.regular, in: .capsule)
        } else {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 12))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                }
        }
    }
}
