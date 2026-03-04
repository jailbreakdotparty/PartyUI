//
//  WelcomeSheet.swift
//  PartyUI
//
//  Created by lunginspector on 2/14/26.
//

import SwiftUI
import FluidGradient

public struct WelcomeSheetView<Context: View, Buttons: View>: View {
    var appName: String
    @ViewBuilder var context: Context
    @ViewBuilder var buttons: Buttons
    
    public init(appName: String = AppInfo.appName, @ViewBuilder context: () -> Context, @ViewBuilder buttons: () -> Buttons) {
        self.appName = appName
        self.context = context()
        self.buttons = buttons()
    }
    
    public var body: some View {
        VStack {
            VStack {
                Text("Welcome to")
                    .font(.title2)
                Text(appName)
                    .font(.system(.largeTitle, weight: .semibold))
                    .foregroundStyle(Color.accentColor)
            }
            .padding(.bottom, 75)
            VStack(spacing: 20) {
                context
            }
            Spacer()
        }
        .padding(.top, 75)
        .padding(.horizontal, 20)
        .safeAreaInset(edge: .bottom) {
            VStack {
                buttons
                    .padding(.horizontal, 30)
            }
        }
        .modifier(WelcomeSheetBackground())
    }
}
