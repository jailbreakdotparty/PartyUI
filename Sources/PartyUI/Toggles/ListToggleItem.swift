//
//  ListToggleItem.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct ListToggleItem: View {
    var icon: String
    var label: String
    @Binding var isOn: Bool
    
    public init(icon: String = "", label: String, isOn: Binding<Bool>) {
        self.icon = icon
        self.label = label
        self._isOn = isOn
    }
    
    public var body: some View {
        Button(action: { isOn.toggle() }) {
            HStack(spacing: 14) {
                if !icon.isEmpty {
                    Image(systemName: icon)
                        .frame(width: 20, alignment: .center)
                }
                Text(label)
                Spacer()
                CheckmarkIcon(isOn: $isOn)
            }
        }
        .modifier(ListTogglePlatter())
    }
}

