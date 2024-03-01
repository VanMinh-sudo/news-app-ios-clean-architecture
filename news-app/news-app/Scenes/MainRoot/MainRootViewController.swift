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

class MainRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
