//
//  AppIcon.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct AppIcon: View {
    var image: Image
    
    init(image: Image = Image(uiImage: AppInfo.appIcon ?? UIImage())) {
        self.image = image
    }
    
    public var body: some View {
        if #available(iOS 19.0, *) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 18))
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 18))
        } else {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 14))
                .overlay {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.primary.opacity(0.2), lineWidth: 2)
                }
        }
    }
}
