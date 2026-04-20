//
//  CheckmarkIcon.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct BindedCheckmark: View {
    @Binding var isOn: Bool
    
    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
            .modifier(UpdatedIconAnimation(isOn: isOn))
    }
}

public struct AnimatedCheckmark: View {
    var isOn: Bool
    
    public init(isOn: Bool) {
        self.isOn = isOn
    }
    
    public var body: some View {
        Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
            .modifier(UpdatedIconAnimation(isOn: isOn))
    }
}
