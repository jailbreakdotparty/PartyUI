//
//  PlatterToggle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public enum ToggleInfoType: Codable {
    case none, info, warning
}

public struct PlatterToggle: View {
    var icon: String
    var label: String
    var color: Color
    var infoType: ToggleInfoType
    var infoTitle: String
    var infoMessage: String
    var minSupportedVersion: Double
    var maxSupportedVersion: Double
    @Binding var isOn: Bool
    
    public init(icon: String = "", label: String, color: Color = Color.accentColor, infoType: ToggleInfoType = .none, infoTitle: String = "Information", infoMessage: String = "", minSupportedVersion: Double = 0.0, maxSupportedVersion: Double = 100.0, isOn: Binding<Bool>) {
        self.icon = icon
        self.label = label
        self.color = color
        self.infoType = infoType
        self.infoTitle = infoTitle
        self.infoMessage = infoMessage
        self._isOn = isOn
        self.minSupportedVersion = minSupportedVersion
        self.maxSupportedVersion = maxSupportedVersion
    }
    
    public var body: some View {
        if doubleSystemVersion() >= minSupportedVersion && doubleSystemVersion() <= maxSupportedVersion {
            Button(action: { isOn.toggle() }) {
                HStack(spacing: 14) {
                    if !icon.isEmpty {
                        Image(systemName: icon)
                            .frame(width: 20, alignment: .center)
                    }
                    Text(label)
                    Spacer()
                    HStack(spacing: 12) {
                        if infoType == .info || infoType == .warning {
                            Button(action: {
                                Alertinator.shared.alert(title: infoTitle, body: infoMessage, showCancel: false, action: { Haptic.shared.play(.soft) })
                            }) {
                                Image(systemName: infoType == .info ? "info.circle" : "exclamationmark.triangle")
                            }
                        }
                        CheckmarkIcon(isOn: $isOn)
                    }
                }
                .foregroundStyle(color)
                .modifier(ListTogglePlatter(backgroundColor: color))
            }
            .buttonStyle(.plain)
        }
    }
}

