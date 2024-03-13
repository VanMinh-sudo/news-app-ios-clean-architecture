//
//  DismissKeyboardByTap.swift
//  news-app
//
//  Created by minhnv1 on 12/03/2024.
//

import UIKit

protocol DismissKeyboardByTap {
    func setupDismissKeyboardTapGesture()
}

extension DismissKeyboardByTap where Self: UIView {
    func setupDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGesture)
    }
}

fileprivate extension UIView {
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
