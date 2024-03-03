//
//  ManageAppLanguageService.swift
//  news-app
//
//  Created by Văn Minh on 01/03/2024.
//

import Foundation

protocol ManageAppLanguageServicable {
    func getCurrentLanguage() -> String
    func setLanguage(_ language: String)
    func appLanguageDidChange()
}

final class UserDefaultManageAppLanguageService: NSObject, ManageAppLanguageServicable {
    
    private let key = "currentLanguage"
    private let languageDidChangeNotification = Notification.Name("languageDidChange")
    
    func getCurrentLanguage() -> String {
        return UserDefaults.standard.string(forKey: key) ?? "en"
    }
    
    func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: key)
    }
    
    func appLanguageDidChange() {
        NotificationCenter.default.post(name: languageDidChangeNotification, object: nil)
    }
}
