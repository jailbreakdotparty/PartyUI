//
//  DesignStyle.swift
//  PartyUI
//
//  Created by lunginspector on 2/12/26.
//

import SwiftUI

public enum cornerRad {
    public static var component: CGFloat {
        if #available(iOS 19.0, *) { return 18 } else { return 12 }
    }
    public static var platter: CGFloat {
        if #available(iOS 19.0, *) { return 26 } else { return 18 }
    }
}

public extension EdgeInsets {
    static let sectionInsets = EdgeInsets(top: 6, leading: 15, bottom: 6, trailing: 15)
}

public extension Animation {
    static let iconUpdate = Animation.spring(response: 0.3, dampingFraction: 1.5)
}
