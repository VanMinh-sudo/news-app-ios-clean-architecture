//
//  MainRootViewController.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//

import UIKit

protocol MainRootDisplayLogic where Self: UIViewController {
    func displayViewModel(_ viewModel: MainRootModel.ViewModel)
}

protocol MainRootViewControllerDelegate: NSObjectProtocol {
    func presentAuthenticationFlow()
}

class MainRootViewController: UIViewController {

    weak var delegate: MainRootViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.presentAuthenticationFlow()
    }

}
