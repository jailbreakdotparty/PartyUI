//
//  AppInfoCell.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct AppInfoCell: View {
    public init() {}
    
    public var body: some View {
        HStack(spacing: 14) {
            AppIcon()
            VStack(alignment: .leading) {
                Text(AppInfo.appName)
                    .font(.system(.title3, weight: .semibold))
                Text("Version \(AppInfo.appVersion) (\(AppInfo.appBuild))")
            }
        }
    }
}
