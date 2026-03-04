//
//  CheckmarkIcon.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct CheckmarkIcon: View {
    @Binding var isOn: Bool
    
    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
            .modifier(UpdatedIconAnimation(isOn: isOn))
    }
}

