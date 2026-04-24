//
//  TextFieldBackground.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

public struct TextFieldBackground: ViewModifier {
    var shape: Shape
    var useFullWidth: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(foregroundStyle: Color = .accentColor, shape: Shape = .rect(cornerRadius: cornerRad.component), useFullWidth: Bool = true) {
        self.shape = shape
        self.useFullWidth = useFullWidth
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: useFullWidth ? .infinity : nil)
            .padding()
            .background(isEnabled ? Color(.quaternarySystemFill) : Color(.systemGray).opacity(0.2), in: AnyShape(shape))
    }
}
