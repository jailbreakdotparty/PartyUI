//
//  PlainToggle.swift
//  PartyUI
//
//  Created by lunginspector on 3/8/26.
//

import SwiftUI

public struct PlainToggle: View {
    var text: String
    var icon: String
    var infoType: ToggleInfoType
    var infoTitle: String
    var infoMessage: String
    var minSupportedVersion: Double
    var maxSupportedVersion: Double
    @Binding var isOn: Bool
    
    public init(text: String, icon: String = "", infoType: ToggleInfoType = .none, infoTitle: String = "Information", infoMessage: String = "", minSupportedVersion: Double = 0.0, maxSupportedVersion: Double = 100.0, isOn: Binding<Bool>) {
        self.text = text
        self.icon = icon
        self.infoType = infoType
        self.infoTitle = infoTitle
        self.infoMessage = infoMessage
        self._isOn = isOn
        self.minSupportedVersion = minSupportedVersion
        self.maxSupportedVersion = maxSupportedVersion
    }
    
    public var body: some View {
        if doubleSystemVersion() >= minSupportedVersion && doubleSystemVersion() <= maxSupportedVersion {
            Toggle(isOn: $isOn) {
                HStack(spacing: 12) {
                    if !icon.isEmpty {
                        Image(systemName: icon)
                            .frame(width: 20, alignment: .center)
                    }
                    Text(text)
                    Spacer()
                    if infoType == .info || infoType == .warning {
                        Button(action: {
                            Alertinator.shared.alert(title: infoTitle, body: infoMessage)
                        }) {
                            Image(systemName: infoType == .info ? "info.circle" : "exclamationmark.triangle")
                        }
                        .buttonStyle(.plain)
                        .padding(.trailing, 6)
                    }
                }
            }
        }
    }
}

