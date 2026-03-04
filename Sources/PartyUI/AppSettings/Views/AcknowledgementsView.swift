//
//  AcknowledgementsView.swift
//  PartyUI
//
//  Created by lunginspector on 2/14/26.
//

import SwiftUI

public struct AcknowledgementsView: View {
    @State var acknowledgementsData: [String : String] = [:]
    public init() {}
    
    public var body: some View {
        NavigationStack {
            List {
                ForEach(acknowledgementsData.keys.sorted(), id: \.self) { acknowledgementName in
                    if let acknowledgementText = acknowledgementsData[acknowledgementName] {
                        let splitName = acknowledgementName.split(separator: "_")
                        let licenseType = splitName.first ?? ""
                        let creditedName = splitName.last ?? ""
                        NavigationLink(creditedName, destination: AcknowledgementsContextView(name: "\(licenseType) License | \(creditedName)", licenseText: acknowledgementText))
                    }
                }
            }
            .navigationTitle("Acknowledgements")
        }
        .onAppear {
            acknowledgementsData = loadAcknowledgements()
        }
    }
}

public struct AcknowledgementsContextView: View {
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
