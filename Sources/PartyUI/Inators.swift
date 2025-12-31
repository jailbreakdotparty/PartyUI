//
//  Inators.swift
//  PartyUI
//
//  Created by jailbreak.party on 12/30/25.
//

import Foundation
import UIKit
import SwiftUI

// MARK: Alertinator
@MainActor
public class Alertinator {
    public static let shared = Alertinator()
    
    var alertController: UIAlertController?
    
    public func alert(title: String, body: String, showCancel: Bool = true) {
        Task { @MainActor in
            alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            if showCancel {
                alertController?.addAction(.init(title: "OK", style: .cancel))
            }
            alertController?.view.tintColor = UIColor(named: "AccentColor")
            self.present(alertController!)
        }
    }
    
    public func alert(title: String, body: String, showCancel: Bool = true, showContinue: Bool = false, continueLabel: String = "Continue", continueAction: @escaping () -> Void = {}, actionLabel: String = "OK", action: @escaping () -> Void) {
        Task { @MainActor in
            alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            if showContinue {
                alertController?.addAction(.init(title: continueLabel, style: .default) { _ in
                    continueAction()
                })
            }
            alertController?.addAction(.init(title: actionLabel, style: .default) { _ in
                action()
            })
            if showCancel {
                alertController?.addAction(.init(title: "Cancel", style: .cancel))
            }
            alertController?.view.tintColor = UIColor(named: "AccentColor")
            self.present(alertController!)
        }
    }
    
    public func prompt(title: String, placeholder: String, showCancel: Bool = true, completion: @escaping (String?) async -> Void) {
        Task { @MainActor in
            alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alertController?.addTextField { field in
                field.placeholder = placeholder
            }
            if showCancel {
                alertController?.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                    Task {
                        await completion(nil)
                    }
                })
            }
            alertController?.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                let field = self.alertController?.textFields?.first
                Task {
                    await completion(field?.text)
                }
            })
            alertController?.view.tintColor = UIColor(named: "AccentColor")
            self.present(alertController!)
        }
    }
    
    @MainActor
    private func present(_ alert: UIAlertController) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           var topController = window.rootViewController {
            
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            topController.present(alert, animated: true)
        }
    }
}

// MARK: Shareinator
@MainActor
public func presentShareSheet(with url: URL) {
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let window = windowScene.windows.first,
       var topController = window.rootViewController {
        
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        topController.present(activityViewController, animated: true)
    }
}

// MARK: Exitinator
@MainActor
public func exitinator() {
    UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
        exit(0)
    }
}

// MARK: Hapticinator
@MainActor
public class Haptic: ObservableObject {
    public static let shared = Haptic()
    
    public func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        Task { @MainActor in
            UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
        }
    }
    
    public func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        Task { @MainActor in
            UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
        }
    }
}

// MARK: Colorinator
extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
