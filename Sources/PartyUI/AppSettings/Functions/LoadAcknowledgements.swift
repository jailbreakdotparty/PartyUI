//
//  LoadAcknowledgements.swift
//  PartyUI
//
//  Created by lunginspector on 2/14/26.
//

import Foundation

public func loadAcknowledgements() -> [String: String] {
    var acknowledgementsData: [String : String] = [:]
    let acknowledgementsDirectoryURL = Bundle.main.bundleURL
    
    // this actually returns the files of said directory.
    if let acknowledgementsFiles = try? FileManager.default.contentsOfDirectory(at: acknowledgementsDirectoryURL, includingPropertiesForKeys: nil) {
        for acknowledgement in acknowledgementsFiles {
            // this returns the text for the license.
            let acknowledgementText = try? String(contentsOf: acknowledgement)
            // this returns the name of the file, minus the extension.
            // we need the user to know the name of the license itself, and the thing being credited. we could just name each file [CreditedName]_[LicenseType], which is kinda ghetto but should work in this situation.
            let acknowledgementName = acknowledgement.deletingPathExtension().lastPathComponent
            let acknowledgementExtension = acknowledgement.pathExtension
            // now this is scuffed lmao
            if acknowledgementExtension == "txt" && acknowledgementName.contains("_") {
                acknowledgementsData[acknowledgementName] = acknowledgementText
            }
        }
        return acknowledgementsData
    } else {
        let idiotArray = ["Uhh that's not good..." : "Something went horrifically wrong. And I'm not sure what it was."]
        return idiotArray
    }
}
