//
//  NewsCommonTextField.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//

import UIKit

class NewsCommonTextField: CustomViewWithXib {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var subLabel: UILabel!
}

extension NewsCommonTextField: CustomizeViewAfterLoadNib {
    func customizeView() {
        textField.borderStyle = .none
    }
}
