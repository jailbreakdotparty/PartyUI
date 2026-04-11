//
//  LinkCreditIcon.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

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
                .glassEffect(.regular.interactive(), in: .capsule)
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
