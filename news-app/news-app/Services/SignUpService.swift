//
//  SignUpService.swift
//  news-app
//
//  Created by minhnv1 on 13/03/2024.
//

import Foundation
import Security

typealias SignUpResult = Result<String?, Error>

protocol SignUpServiceable {
    func signUp(email: String, password: String) async -> SignUpResult
}

class KeyChainSignUpAdapter: SignUpServiceable {
    private var dataGateway: KeychainSignUpDataGateway!
    func signUp(email: String, password: String) async -> SignUpResult {
        dataGateway = KeychainSignUpDataGateway.init(email: email, password: password)
        if dataGateway.doesEmailExistInKeychain() {
            return SignUpResult.failure(CommonError(errorKey: "authen_emailExist"))
        }
        return dataGateway.saveEmailAndPassword()
    }
}

class KeychainSignUpDataGateway {
    var email: String
    var password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    func saveEmailAndPassword() -> SignUpResult {
        let query = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrAccount: email.data(using: .utf8)!,
                kSecValueData: password.data(using: .utf8)!
        ] as CFDictionary

        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            let error = CommonError(errorKey: "data_saveError")
            return Result.failure(error)
        }
        return Result.success(nil)
    }

    func doesEmailExistInKeychain() -> Bool {
        let emailData = email.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: emailData,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        return status == errSecSuccess
    }
}

