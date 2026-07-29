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

public enum AppInfo {
    public static var appName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? Bundle.main.infoDictionary?["CFBundleName"] as! String
    }
    public static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
    }
    public static var appBuild: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
    }
    public static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    public static var appIcon: UIImage? {
        if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return UIImage(named: lastIcon) ?? UIImage()
        }
        return UIImage()
    }
}

// return doubleSystemVersion
@MainActor public func doubleSystemVersion() -> Double {
    let rawSystemVersion = UIDevice.current.systemVersion
    let parsedSystemVersion = rawSystemVersion.split(separator: ".").prefix(2).joined(separator: ".")
    return Double(parsedSystemVersion) ?? 0.0
}
