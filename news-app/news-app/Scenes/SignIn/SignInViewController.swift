//
//  SignInViewController.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol SignInDisplayLogic where Self: UIViewController {

    func displayViewModel(_ viewModel: SignInModel.ViewModel)
}

final class SignInViewController: UIViewController {

    typealias SignInFactory = SignInInteractorFactorable & SignInRouterFactorable

    private let mainView: SignInView
    private var interactor: SignInInteractable!
    private var router: SignInRouting!

    required init(factory: SignInFactory, mainView: SignInView, dataSource: SignInModel.DataSource) {
        self.mainView = mainView

        super.init(nibName: nil, bundle: nil)

        let interactorFactory = factory as! SignInInteractorFactorable.InteractableFactory
        interactor = factory.makeInteractor(factory: interactorFactory, viewController: self, dataSource: dataSource)
        router = factory.makeRouter(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        mainView.delegate = self
        view = mainView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, You shouldn't initialize the ViewController using Storyboards")
    }
}

// MARK: - SignInDisplayLogic
extension SignInViewController: SignInDisplayLogic {

    func displayViewModel(_ viewModel: SignInModel.ViewModel) {
        DispatchQueue.main.async {
            switch viewModel {

            case .doSomething(let viewModel):
                self.displayDoSomething(viewModel)
            }
        }
    }
}


// MARK: - SignInViewDelegate
extension SignInViewController: SignInViewDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == SignInView.userNameTextFieldTag {
        }
    }
}


// MARK: - Private Zone
private extension SignInViewController {

    func displayDoSomething(_ viewModel: NSObject) {
        print("Use the mainView to present the viewModel")
        //example of using router
        router.routeTo(.xScene(xData: 22))
    }
}
