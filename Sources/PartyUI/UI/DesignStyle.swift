//
//  DesignStyle.swift
//  PartyUI
//
//  Created by lunginspector on 2/12/26.
//

import SwiftUI

public enum DesignStyle {
    public static var defaultComponentRadius: CGFloat {
        if #available(iOS 19.0, *) { return 18 } else { return 12 }
    }
    public static var platterCornerRadius: CGFloat {
        if #available(iOS 19.0, *) { return 26 } else { return 18 }
    }
    public static var smallPlatterCornerRadius: CGFloat {
        if #available(iOS 19.0, *) { return 16 } else { return 12 }
    }
    public static var terminalCornerRadius: CGFloat {
        if #available(iOS 19.0, *) { return 24 } else { return 18 }
    }
    public static var creditCellSpacing: CGFloat {
        if #available(iOS 19.0, *) { return 14 } else { return 16 }
    }
    public static var welcomeSheetButtonShape: AnyShape {
        if #available(iOS 19.0, *) { return AnyShape(.capsule) } else { return AnyShape(.rect(cornerRadius: 12)) }
    }
    public static var isSolariumUI: Bool {
        if #available(iOS 19.0, *) { return true } else { return false }
    }
    public static var platterEdgeInsets: EdgeInsets {
        return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
    }
}

public extension EdgeInsets {
    static let dropdownRowInsets = EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20)
    static let itemRowInsets = EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    static let zeroInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
}
