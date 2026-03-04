//
//  TinyButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TinyButtonStyle: PrimitiveButtonStyle {
    public var color: Color
    
    public init(color: Color = .accentColor) {
        self.color = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .foregroundStyle(color)
            .opacity(0.8)
            .padding(.top, 4)
            .modifier(FadeAnimation())
            .simultaneousGesture(TapGesture().onEnded{
                configuration.trigger()
            })
    }
}
