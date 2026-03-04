//
//  AccentColor.swift
//  PartyUI
//
//  Created by lunginspector on 2/16/26.
//

import SwiftUI

public struct ColorOption: Identifiable, Hashable {
    var label: String
    var color: Color
    public var id: String { label }
    
    public enum CodingKeys: String, CodingKey {
        case label, color
    }
    
    public init(label: String, color: Color) {
        self.label = label
        self.color = color
    }
}

public enum AppearanceOptions: String, CaseIterable {
    case light, dark, automatic
    
    public var appearances: ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .automatic: return nil
        }
    }
}

@MainActor
public final class AppTheme: ObservableObject {
    public static let shared = AppTheme()
    @AppStorage("accentColor") public var accentColor: Color = .accentColor
    @AppStorage("appearance") public var appearance: AppearanceOptions = .automatic
    @AppStorage("accentColorLabel") public var accentColorLabel: String = "Default"
    
    public init() {}
}

// Source - https://stackoverflow.com/a/73185092
// Posted by EJZ, modified by community. See post 'Timeline' for change history
// Retrieved 2026-02-17, License - CC BY-SA 4.0
extension Color: @retroactive RawRepresentable {
    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self = .black
            return
        }

        do {
            if let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) {
                self = Color(color)
            } else {
                self = .black
            }
        } catch {
            self = .black
        }
    }

    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
}
