//
//  LicenseView.swift
//  PartyUI
//
//  Created by lunginspector on 2/14/26.
//

import SwiftUI

public struct LicenseView: View {
    @State var licenseDict: [String : String] = [:]
    public init() {}
    
    public var body: some View {
        NavigationStack {
            List {
                ForEach(licenseDict.keys.sorted(), id: \.self) { name in
                    if let text = licenseDict[name] {
                        let splitName = name.split(separator: "_")
                        let license = splitName.first ?? ""
                        let creditor = splitName.last ?? ""
                        NavigationLink(creditor, destination: LicenseDetailsView(name: "\(license) License | \(creditor)", licenseText: text))
                    }
                }
            }
            .navigationTitle("Licenses")
        }
        .onAppear {
            licenseDict = getLicenseDict()
        }
    }
}

public struct LicenseDetailsView: View {
    var name: String
    var licenseText: String
    
    public init(name: String, licenseText: String) {
        self.name = name
        self.licenseText = licenseText
    }
    
    public var body: some View {
        NavigationStack {
            List {
                Section(header: HeaderLabel(text: name, icon: "person.text.rectangle")) {
                    Text(licenseText)
                        .font(.system(.subheadline, design: .monospaced))
                        .contextMenu {
                            Button(action: {
                                UIPasteboard.general.string = licenseText
                            }) {
                                Label("Copy to Clipboard", systemImage: "doc.on.doc")
                            }
                        }
                }
            }
        }
    }
}
