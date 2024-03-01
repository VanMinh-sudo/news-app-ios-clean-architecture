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

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
