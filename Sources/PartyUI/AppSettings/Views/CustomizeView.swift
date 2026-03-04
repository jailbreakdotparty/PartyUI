//
//  CustomizeView.swift
//  PartyUI
//
//  Created by lunginspector on 2/16/26.
//

import SwiftUI

public struct CustomizeView: View {
    @EnvironmentObject var theme: AppTheme
    @AppStorage("enableCustomColor") var enableCustomColor: Bool = false
    
    @State private var testToggle: Bool = true
    @State private var testListRowItem: Bool = true
    
    var colorOptions: [ColorOption]
    
    public init(colorOptions: [ColorOption]) {
        self.colorOptions = colorOptions
    }
    
    public var body: some View {
        NavigationStack {
            List {
                Section(header: HeaderLabel(text: "Preview", icon: "eye")) {
                    VStack(spacing: 16) {
                        Button(action: {
                            
                        }) {
                            ButtonLabel(text: "Primary Button", icon: "app")
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        Button(action: {
                            
                        }) {
                            ButtonLabel(text: "Transcluent Button", icon: "app")
                        }
                        .buttonStyle(TranslucentButtonStyle())
                        Toggle("Toggle", isOn: $testToggle)
                    }
                }
                .tint(theme.accentColor)
                Section(header: HeaderLabel(text: "Appearance", icon: "paintbrush")) {
                    Picker("", selection: $theme.appearance) {
                        ForEach(AppearanceOptions.allCases, id: \.self) { option in
                            Text(option.rawValue.capitalized).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: HeaderLabel(text: "Accent Color", icon: "paintpalette")) {
                    VStack(alignment: .leading) {
                        Text(enableCustomColor ? "Custom Color" : theme.accentColorLabel)
                            .foregroundStyle(theme.accentColor)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.leading)
                        ScrollView(.horizontal) {
                            HStack(spacing: 14) {
                                // get the colors from the ColorOptinons array inside of the parent view
                                ForEach(colorOptions, id: \.self) { option in
                                    Button(action: {
                                        // set the accentColor itself to the chosen color when it's clicked
                                        theme.accentColor = option.color
                                        // also update the accentColorLabel
                                        theme.accentColorLabel = option.label
                                    }) {
                                        Circle()
                                            .fill(option.color)
                                            .frame(width: 50, height: 50)
                                            .overlay {
                                                if option.label == theme.accentColorLabel {
                                                    Circle()
                                                        .strokeBorder(Color(.label), lineWidth: 3)
                                                }
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .frame(maxWidth: .infinity)
                        .scrollIndicators(.hidden)
                        .opacity(enableCustomColor ? 0.6 : 1.0)
                        .disabled(enableCustomColor)
                        .padding(.bottom)
                    }
                    .listRowInsets(EdgeInsets())
                    Toggle("Custom Accent Color", isOn: $enableCustomColor)
                    if enableCustomColor {
                        ColorPicker("Custom Color", selection: $theme.accentColor, supportsOpacity: false)
                    }
                }
                .listRowBackground(Color.accentColor.opacity(0.2))
            }
            .navigationTitle("Customize")
            .onChange(of: theme.accentColor) { newValue in
                Haptic.shared.play(.soft)
            }
            .onChange(of: theme.appearance) { newValue in
                Haptic.shared.play(.soft)
            }
            .onChange(of: enableCustomColor) { newValue in
                if !newValue {
                    theme.accentColor = Color("AccentColor")
                    theme.accentColorLabel = "Default"
                }
            }
        }
    }
}

