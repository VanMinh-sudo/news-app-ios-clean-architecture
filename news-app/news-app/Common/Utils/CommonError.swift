//
//  CommonError.swift
//  news-app
//
//  Created by minhnv1 on 13/03/2024.
//

import Foundation

class CommonError: Error {
    var errorKey: String?
    var localizeErrorKey: String?
    init(errorKey: String?) {
        self.errorKey = errorKey
        localizeErrorKey = localized(key: errorKey ?? "")
    }
}
