//
//  RootCoordinator.swift
//  news-app
//
//  Created by minhnv1 on 20/03/2024.
//

import UIKit

public class RootCoordinator: NSObject, Coordinator {

    public var children: [Coordinator] = []
    public let router: Router

    private let viewController = MainRootViewController(nibName: nil, bundle: nil)

    public init(router: Router) {
        self.router = router
    }

    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        viewController.delegate = self
        router.present(viewController, animated: true)
    }
}

extension RootCoordinator: MainRootViewControllerDelegate {
    func presentAuthenticationFlow() {
        let loginViewController = SignInViewController(factory: ConcreteSignInFactory(), mainView: SignInView(), dataSource: SignInModel.DataSource())
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.willMove(toParent: viewController)
        viewController.view.addSubview(navigationController.view)
        navigationController.view.frame = viewController.view.frame
        viewController.addChild(navigationController)
        navigationController.didMove(toParent: viewController)
        let router = NavigationRouter(navigationController: navigationController)
        let authenticationCoordinator = AuthenticationCoordinator(router: router)
        authenticationCoordinator.signInViewController = loginViewController
        presentChild(authenticationCoordinator, animated: true)
    }
}

