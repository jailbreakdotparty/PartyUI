//
//  UpdatedIconAnimation.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct UpdatedIconAnimation: ViewModifier {
    public var isOn: Bool
    
    public init(isOn: Bool) {
        self.isOn = isOn
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 19.0, *) {
            content
                .contentTransition(.symbolEffect(.replace))
        } else {
            content
                .animation(.default.speed(2), value: isOn)
        }
    }
}

