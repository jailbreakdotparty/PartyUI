//
//  TinyInfoPlatter.swift
//  PartyUI
//
//  Created by lunginspector on 4/11/26.
//

import SwiftUI

var sPlatter: CGFloat {
    if #available(iOS 19.0, *) { return 16 } else { return 12 }
}

public struct TinyInfoPlatter: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(Color(.quaternarySystemFill), in: .rect(cornerRadius: sPlatter))
    }
}
