//
//  PrimaryTextFieldStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

// this is a modifier for good reason (PrimaryTextFieldButton).
public struct PrimaryTextFieldStyle: ViewModifier {
    var isPlain: Bool
    var shape: AnyShape
    var autocorrectionDisabled: Bool
    var autocapitializationDisabled: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(isPlain: Bool = false, shape: AnyShape = AnyShape(.rect(cornerRadius: DesignStyle.defaultComponentRadius)), autocorrectionDisabled: Bool = false, autocapitializationDisabled: Bool = false) {
        self.shape = shape
        self.autocorrectionDisabled = autocorrectionDisabled
        self.autocapitializationDisabled = autocapitializationDisabled
        self.isPlain = isPlain
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 19.0, *) {
            if !isPlain {
                content
                    .foregroundStyle(isEnabled ? .primary : Color(.gray))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .glassEffect(.regular.tint(isEnabled ? Color.clear : Color(.tertiarySystemBackground)), in: shape)
                    .autocorrectionDisabled(autocorrectionDisabled)
                    .textInputAutocapitalization(autocapitializationDisabled ? .never : .sentences)
                    .disabled(!isEnabled)
            } else {
                content
                    .foregroundStyle(isEnabled ? .primary : Color(.gray))
                    .frame(maxWidth: .infinity)
                    .autocorrectionDisabled(autocorrectionDisabled)
                    .textInputAutocapitalization(autocapitializationDisabled ? .never : .sentences)
                    .disabled(!isEnabled)
            }
        } else {
            if !isPlain {
                content
                    .foregroundStyle(isEnabled ? .primary : Color(.gray))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.quaternarySystemFill), in: shape)
                    .autocorrectionDisabled(autocorrectionDisabled)
                    .textInputAutocapitalization(autocapitializationDisabled ? .never : .sentences)
                    .disabled(!isEnabled)
            } else {
                content
                    .foregroundStyle(isEnabled ? .primary : Color(.gray))
                    .frame(maxWidth: .infinity)
                    .autocorrectionDisabled(autocorrectionDisabled)
                    .textInputAutocapitalization(autocapitializationDisabled ? .never : .sentences)
                    .disabled(!isEnabled)
            }
        }
    }
}
