//
//  EmailValidatorService.swift
//  news-app
//
//  Created by minhnv1 on 13/03/2024.
//

import Foundation

protocol EmailValidatorServiceable {
    func isValidEmail(email: String?) -> Bool
}

class EmailValidatorService: EmailValidatorServiceable {
    func isValidEmail(email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

