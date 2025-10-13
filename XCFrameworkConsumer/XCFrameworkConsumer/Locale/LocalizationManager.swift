//
//  LocalizationManager.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 06/08/25.
//
import Foundation

class LocalizationManager {
    static let shared = LocalizationManager()

    private let languageKey = "selectedLanguage"

    var currentLanguage: String {
        UserDefaults.standard.string(forKey: languageKey)
            ?? Locale.preferredLanguages.first?.components(separatedBy: "-").first ?? "en"
    }

    func changeLanguage() {
        let newLang = (currentLanguage == "en") ? "hi" : "en"
        UserDefaults.standard.set(newLang, forKey: languageKey)
        UserDefaults.standard.set([newLang], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

        // Notify SceneDelegate to reload UI
        NotificationCenter.default.post(name: .languageChanged, object: nil)
    }
}

extension Notification.Name {
    static let languageChanged = Notification.Name("languageChanged")
}
