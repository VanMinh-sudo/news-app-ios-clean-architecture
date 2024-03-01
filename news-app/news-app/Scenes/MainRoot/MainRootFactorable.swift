//
//  MainRootFactorable.swift
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

extension AppInjector {
    struct MainRootInjector {}
}
extension AppInjector.MainRootInjector: MainRootFactorable {}

protocol MainRootFactorable: MainRootInteractorFactorable, MainRootPresenterFactorable, MainRootRouterFactorable, MainRootServicesFactorable { }

protocol MainRootInteractorFactorable {
    typealias InteractableFactory = MainRootPresenterFactorable & MainRootServicesFactorable

    func makeInteractor(factory: InteractableFactory, viewController: MainRootDisplayLogic?, dataSource: MainRootModel.DataSource) -> MainRootInteractable
}

protocol MainRootPresenterFactorable {
    func makePresenter(viewController: MainRootDisplayLogic?) -> MainRootPresentationLogic
}

protocol MainRootRouterFactorable {
    func makeRouter(viewController: UIViewController?) -> MainRootRouting
}

extension MainRootFactorable {

    func makeInteractor(factory: InteractableFactory, viewController: MainRootDisplayLogic?, dataSource: MainRootModel.DataSource) -> MainRootInteractable {
        MainRootInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
    }

    func makePresenter(viewController: MainRootDisplayLogic?) -> MainRootPresentationLogic {
        MainRootPresenter(viewController: viewController)
    }

    func makeRouter(viewController: UIViewController?) -> MainRootRouting {
        MainRootRouter(viewController: viewController)
    }
}


// MARK: - Service Factorable
protocol MainRootServicesFactorable {

    //func makeXService() -> xService
}

extension MainRootServicesFactorable {

    //func makeXService() -> xService {
    //   xService()
    //}
}