//
//  TextFieldButton.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TextFieldButton<TextField : View, Button : View>: View {
    var textFieldBackground: TextFieldBackground
    @ViewBuilder var textField: TextField
    @ViewBuilder var button: Button
    @Environment(\.isEnabled) var isEnabled
    
    public init(textFieldBackground: TextFieldBackground = TextFieldBackground(), @ViewBuilder textField: () -> TextField, @ViewBuilder button: () -> Button) {
        self.textFieldBackground = textFieldBackground
        self.textField = textField()
        self.button = button()
    }
    
    public var body: some View {
        HStack {
            textField
                .frame(maxWidth: .infinity)
            button
                .buttonStyle(.plain)
                .animation(.iconUpdate, value: isEnabled)
                .environment(\.isEnabled, true)
        }
        .modifier(textFieldBackground)
        .animation(.default, value: isEnabled)
    }
}
