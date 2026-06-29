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

let ptSpacing: CGFloat = {
    if #available(iOS 19.0, *) { return 14 } else { return 12 }
}()

public struct PlatterToggle: View {
    var text: String
    var icon: String
    var color: Color
    var infoType: ToggleInfoType
    var infoTitle: String
    var infoMessage: String
    var ignoreVrs: Bool
    var minSupportedVersion: Double
    var maxSupportedVersion: Double
    @Binding var isOn: Bool
    
    public init(text: String, icon: String = "", color: Color = Color.accentColor, infoType: ToggleInfoType = .none, infoTitle: String = "Information", infoMessage: String = "", ignoreVrs: Bool = false, minSupportedVersion: Double = 0.0, maxSupportedVersion: Double = 100.0, isOn: Binding<Bool>) {
        self.text = text
        self.icon = icon
        self.color = color
        self.infoType = infoType
        self.infoTitle = infoTitle
        self.infoMessage = infoMessage
        self._isOn = isOn
        self.ignoreVrs = ignoreVrs
        self.minSupportedVersion = minSupportedVersion
        self.maxSupportedVersion = maxSupportedVersion
    }
    
    public var body: some View {
        if ignoreVrs || (doubleSystemVersion() >= minSupportedVersion && doubleSystemVersion() <= maxSupportedVersion) {
            Button {
                isOn.toggle()
            } label: {
                HStack(spacing: ptSpacing) {
                    if !icon.isEmpty {
                        Image(systemName: icon)
                            .frame(width: 20, alignment: .center)
                    }
                    Text(text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 12) {
                        if infoType == .info || infoType == .warning {
                            Button(action: {
                                Alertinator.shared.alert(title: infoTitle, body: infoMessage)
                            }) {
                                Image(systemName: infoType == .info ? "info.circle" : "exclamationmark.triangle")
                            }
                        }
                        Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                            .animation(.iconUpdate, value: isOn)
                    }
                }
            }
            .buttonStyle(TranslucentButtonStyle(color: color))
        }
    }
}

