//
//  AppDelegateRouter.swift
//  news-app
//
//  Created by minhnv1 on 20/03/2024.
//

import UIKit

public class SceneDelegateRouter: Router {

    public let window: UIWindow

    public init(window: UIWindow) {
        self.window = window
    }

    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    public func dismiss(animated: Bool) {
        // don't do anything
    }
}
