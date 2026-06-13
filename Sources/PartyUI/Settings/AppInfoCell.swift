//
//  AppInfoCell.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct AppInfoCell: View {
    let build: String
    
    public init(build: String = "") {
        self.build = build
    }
    
    public var body: some View {
        HStack(spacing: 14) {
            AppIconCell()
            VStack(alignment: .leading) {
                Text(AppInfo.appName)
                    .font(.system(.title3, weight: .semibold))
                Text("Version \(AppInfo.appVersion) (\(build))")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

public struct AppIconCell: View {
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
                .background(PlaceholderAppIconCell())
                .clipShape(.rect(cornerRadius: 18))
                .glassEffect(.regular, in: .rect(cornerRadius: 18))
        } else {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .background(PlaceholderAppIconCell())
                .clipShape(.rect(cornerRadius: 14))
                .overlay {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.secondary.opacity(0.2), lineWidth: 1.5)
                }
        }
    }
}

struct PlaceholderAppIconCell: View {
    var body: some View {
        Image(systemName: "questionmark.square")
            .foregroundStyle(.secondary)
            .frame(width: 64, height: 64)
            .background(Color(.systemGray5))
    }
}
