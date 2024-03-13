//
//  AletUtils.swift
//  news-app
//
//  Created by minhnv1 on 13/03/2024.
//
import UIKit

extension UIViewController {
    func showOKAlert(title: String?, message: String?, pressOKHandler: (() -> ())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alertController.dismiss(animated: true, completion: pressOKHandler)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
