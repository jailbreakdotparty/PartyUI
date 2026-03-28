//
//  DoubleSystemVersion.swift
//  PartyUI
//
//  Created by lunginspector on 3/27/26.
//

import Foundation
import UIKit

@MainActor public func doubleSystemVersion() -> Double {
    let rawSystemVersion = UIDevice.current.systemVersion
    let parsedSystemVersion = rawSystemVersion.split(separator: ".").prefix(2).joined(separator: ".")
    return Double(parsedSystemVersion) ?? 0.0
}
