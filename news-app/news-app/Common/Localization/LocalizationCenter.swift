//
//  LocalizationCenter.swift
//  news-app
//
//  Created by Văn Minh on 01/03/2024.
//

import Foundation

protocol LocalizationCenterable {
    func localized(_ key: String) -> String
}

final class LocalizationCenter: LocalizationCenterable {
    
    private var manageAppLanguageService: ManageAppLanguageServicable!
    
    private init() {}
    
    func localized(_ key: String) -> String {
//        let currentLanguage = manageAppLanguageService.getCurrentLanguage()
        return NSLocalizedString(key, comment: "")
    }
}

func localized(key: String, comment: String = "") -> String? {
    return String(localized: String.LocalizationValue(key), table: "Localizable")
}
