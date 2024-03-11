//
//  SignInInteractor.swift
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

typealias SignInInteractable = SignInBusinessLogic & SignInDataStore

protocol SignInBusinessLogic {

    func doRequest(_ request: SignInModel.Request)
}

protocol SignInDataStore {
    var dataSource: SignInModel.DataSource { get }
}

final class SignInInteractor: SignInDataStore {

    var dataSource: SignInModel.DataSource

    private var factory: SignInInteractorFactorable.InteractableFactory
    private var presenter: SignInPresentationLogic

    init(factory: SignInInteractorFactorable.InteractableFactory, viewController: SignInDisplayLogic?, dataSource: SignInModel.DataSource) {
        self.factory = factory
        self.dataSource = dataSource
        self.presenter = factory.makePresenter(viewController: viewController)
    }
}

extension SignInInteractor: SignInBusinessLogic {
    func doRequest(_ request: SignInModel.Request) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else {return}
            switch request {
            case .userNameDidChange(let userName):
                dataSource.userName = userName
                self.presenter.presentResponse(SignInModel.Response.userNameDidChange(userName))
            }
        }
    }
}
