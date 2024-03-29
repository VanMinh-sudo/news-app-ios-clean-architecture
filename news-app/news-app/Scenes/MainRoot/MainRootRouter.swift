//
//  MainRootRouter.swift
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

protocol MainRootRouting {
    
    func routeTo(_ route: MainRootModel.Route)
}

final class MainRootRouter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}


// MARK: - MainRootRouting
extension MainRootRouter: MainRootRouting {
    
    func routeTo(_ route: MainRootModel.Route) {
        DispatchQueue.main.async {
            switch route {
                
            case .dismissMainRootScene:
                self.dismissMainRootScene()
                
            case .xScene(let data):
                self.showXSceneBy(data)
            }
        }
    }
}


// MARK: - Private Zone
private extension MainRootRouter {
    
    func dismissMainRootScene() {
        viewController?.dismiss(animated: true)
    }
    
    func showXSceneBy(_ data: Int) {
        print("will show the next screen")
    }
}
