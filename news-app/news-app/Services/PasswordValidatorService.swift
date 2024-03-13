//
//  PasswordValidator.swift
//  news-app
//
//  Created by minhnv1 on 12/03/2024.
//

import Foundation

protocol PasswordValidatorServicable {
    func isValid(_ password: String?) -> Bool
}

final class PasswordValidatorService: PasswordValidatorServicable {
    //Minimum 8 characters at least 1 Alphabet and 1 Number:
    func isValid(_ password: String?) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}
