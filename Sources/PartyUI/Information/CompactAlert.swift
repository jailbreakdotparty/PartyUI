//
//  CompactAlert.swift
//  PartyUI
//
//  Created by lunginspector on 4/5/26.
//

import SwiftUI

public struct CompactAlert: View {
    var label: String
    var icon: String
    var text: String
    var color: Color
    var useBackground: Bool
    
    public init(label: String = "", icon: String = "", text: String, color: Color = Color.accentColor, useBackground: Bool = false) {
        self.label = label
        self.icon = icon
        self.text = text
        self.color = color
        self.useBackground = useBackground
    }
    
    public var body: some View {
        HStack(spacing: useBackground ? 12 : 14) {
            if !icon.isEmpty {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .foregroundStyle(color)
            }
            VStack(alignment: .leading) {
                if !label.isEmpty {
                    Text(label)
                        .fontWeight(.medium)
                }
                Text(text)
                    .font(!label.isEmpty ? .subheadline : .body)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .modifier(CompactAlertBackground(useBackground: useBackground, color: color))
    }
}

struct CompactAlertBackground: ViewModifier {
    var useBackground: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        if useBackground {
            content
                .padding()
                .background(color.opacity(0.2), in: .rect(cornerRadius: DesignStyle.platterCornerRadius))
                .modifier(FadeScaleAnimation())
        } else { content }
    }
}

#Preview {
    List {
        CompactAlert(label: "Alert", icon: "exclamationmark.triangle", text: "This is the body of an alert with it's own background.", useBackground: true)
        CompactAlert(label: "Alert", icon: "camera", text: "This is the body of an alert without it's own background.", useBackground: false)
    }
}
