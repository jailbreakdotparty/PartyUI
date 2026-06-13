//
//  GetLicenseDict.swift
//  PartyUI
//
//  Created by lunginspector on 2/14/26.
//

import Foundation

public func getLicenseDict() -> [String : String] {
    var licenseDict: [String : String] = [:]
    let bundleURL = Bundle.main.bundleURL
    
    if let licensesURL = try? FileManager.default.contentsOfDirectory(at: bundleURL, includingPropertiesForKeys: nil) {
        for url in licensesURL {
            // block it if it's not an actual license
            let fileName = url.deletingPathExtension().lastPathComponent
            let fileExtension = url.pathExtension
            
            if fileName.contains("_") && fileExtension == "txt" {
                let licenseText = try? String(contentsOf: url)
                licenseDict[fileName] = licenseText
            }
        }
    }
    return licenseDict
}
