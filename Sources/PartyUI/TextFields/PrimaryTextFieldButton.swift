//
//  PrimaryTextFieldButton.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct PrimaryTextFieldButton<Button: View>: View {
    var titleKey: String
    @Binding var text: String
    var useSecureField: Bool
    var textFieldStyle: PrimaryTextFieldStyle
    @ViewBuilder var button: Button
    @Environment(\.isEnabled) private var isEnabled
    
    public init(titleKey: String, text: Binding<String>, useSecureField: Bool = false, textFieldStyle: PrimaryTextFieldStyle = PrimaryTextFieldStyle(), @ViewBuilder button: () -> Button) {
        self.titleKey = titleKey
        self._text = text
        self.useSecureField = useSecureField
        self.textFieldStyle = textFieldStyle
        self.button = button()
    }
    
    public var body: some View {
        HStack {
            if useSecureField {
                SecureField(titleKey, text: $text)
                    .disabled(!isEnabled)
            } else {
                TextField(titleKey, text: $text)
                    .disabled(!isEnabled)
            }
            button
                .buttonStyle(.plain)
                .environment(\.isEnabled, true)
                .foregroundStyle(Color(.label))
                .modifier(UpdatedIconAnimation(isOn: isEnabled))
        }
        .modifier(textFieldStyle)
        .animation(.easeOut, value: isEnabled)
    }
}
