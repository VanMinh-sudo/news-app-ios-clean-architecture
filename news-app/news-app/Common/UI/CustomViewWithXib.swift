//
//  CustomViewWithXib.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//

import UIKit

class CustomViewWithXib: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        let contentView = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)?[0] as! UIView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
