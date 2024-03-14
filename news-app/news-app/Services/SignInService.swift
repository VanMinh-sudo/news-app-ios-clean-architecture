//
//  SignInService.swift
//  news-app
//
//  Created by Văn Minh on 14/03/2024.
//

import Foundation
import Security

typealias SignInResult = Result<String?, SignInError>

struct SignInError: Error {
    enum ErrorType {
        case wrongEmail
        case wrongPassword
        case other
    }
    var type: ErrorType
}

protocol SignInServiceable {
    func signIn(email: String, password: String) async -> SignInResult
}

class KeychainSignInAdapter: SignInServiceable {
    func signIn(email: String, password: String) async -> SignInResult {
        return .success(nil)
    }
}
