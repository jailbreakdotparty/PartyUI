//
//  HeaderDropdown.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//

import SwiftUI

// Here's the core functionality of this system: In the parent view, the user will pass a binded bool to set a true/false state for whether or not the list is expanded or not. This state will be stored and given it's own custom name based on the label (text).
// Also being passed is an itemCount interger. This is, by default, set to one. If, on the change of itemCount, it goes from 1 to 0, the isExpanded boolean should be set to false and the list should collapse. If, on the change of item count, it goes from 0 to 1, the isExpanded boolean should be set to true and the list should expand.
public struct HeaderDropdown: View {
    var text: String
    var icon: String
    @Binding var isExpanded: Bool
    var useThemedLabel: Bool
    var useItemCount: Bool
    var itemCount: Int
    @AppStorage var isExpandedStorage: Bool
    
    @Environment(\.colorScheme) var colorScheme
    // i hate everyone who uses ios 16.
    @State private var previousItemCount: Int
    
    public init(text: String, icon: String, isExpanded: Binding<Bool>, useThemedLabel: Bool = false, useItemCount: Bool = false, itemCount: Int = 1, previousItemCount: Int = 0) {
        self.text = text
        self.icon = icon
        self._isExpanded = isExpanded
        self.useThemedLabel = useThemedLabel
        self.useItemCount = useItemCount
        self.itemCount = itemCount
        // this is defintely scuffed, but it won't really matter to the average user as long as i don't change header labels or use a header label more than once.
        self._isExpandedStorage = AppStorage(wrappedValue: true, "isExpanded_\(text)")
        self.previousItemCount = previousItemCount
    }
    
    public var body: some View {
        Button(action: { withAnimation { isExpanded.toggle() } }) {
            HStack {
                if useThemedLabel {
                    ThemedHeaderLabel(text: text, icon: icon)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    HeaderLabel(text: text, icon: icon)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                if useItemCount {
                    Text(String(itemCount))
                        .frame(minWidth: 14)
                        .frame(height: 14)
                        .padding(6)
                        .background(Color(.secondarySystemBackground), in: .capsule)
                }
                Image(systemName: "chevron.down")
                    .frame(width: 24, height: 24, alignment: .center)
                    .rotationEffect(.degrees(isExpanded ? 0 : -90))
                    .animation(.easeInOut(duration: 0.2), value: isExpanded)
            }
            .onAppear {
                isExpanded = isExpandedStorage
                previousItemCount = itemCount
            }
            .onChange(of: itemCount) { newValue in
                if newValue == 0 {
                    isExpanded = false
                } else if previousItemCount == 0 && newValue == 1 {
                    isExpanded = true
                }
                // this works, don't question it.
                previousItemCount = newValue
            }
            .onChange(of: isExpanded) { newValue in
                isExpandedStorage = newValue
            }
        }
        .buttonStyle(.plain)
    }
}
