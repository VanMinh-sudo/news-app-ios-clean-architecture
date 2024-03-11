//
//  SignInPresenter.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation

protocol SignInPresentationLogic {
    func presentResponse(_ response: SignInModel.Response)
}

final class SignInPresenter {
    private weak var viewController: SignInDisplayLogic?

    init(viewController: SignInDisplayLogic?) {
        self.viewController = viewController
    }
}


// MARK: - SignInPresentationLogic
extension SignInPresenter: SignInPresentationLogic {

    func presentResponse(_ response: SignInModel.Response) {

        switch response {
        case .userNameDidChange(let userName):
            handleUserNameDidChange(userName: userName)
        }
    }
}


// MARK: - Private Zone
private extension SignInPresenter {
    func handleUserNameDidChange(userName: String?) {

        let viewModel = SignInModel.ViewModel.reloadUserNameTextField(isNotEmpty(userName))
    }
}
