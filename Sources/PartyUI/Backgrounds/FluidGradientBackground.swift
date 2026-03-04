//
//  AccentFluidGradient.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI
import FluidGradient

public struct FluidGradientBackground: View {
    public init() {}
    
    public var body: some View {
        VStack {
            FluidGradient(blobs: [Color("AccentColor").opacity(0.2), Color("AccentColor").opacity(0.2)], highlights: [Color("AccentColor").opacity(0.2), Color("AccentColor").opacity(0.2)], speed: 0.4, blur: 0.8)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
        }
    }
}
