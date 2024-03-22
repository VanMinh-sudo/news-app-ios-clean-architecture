//
//  AddChildRouter.swift
//  news-app
//
//  Created by minhnv1 on 20/03/2024.
//

import UIKit

class AddChildRouter : Router {

    private var rootViewController: UIViewController!

    init(rootViewController: UIViewController!) {
        self.rootViewController = rootViewController
    }

    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        let options: UIView.AnimationOptions = [.curveLinear, .beginFromCurrentState]

        rootViewController.addChild(viewController)
        rootViewController.view.addSubview(viewController.view)

        viewController.view.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0.1, options: options, animations: { [unowned self] in
            viewController.view.alpha = 1
            self.rootViewController.view.alpha = 0
        }) { [unowned self] (finished) in
            if finished {
                viewController.didMove(toParent: self.rootViewController)
            }
        }

    }

    func dismiss(animated: Bool) {}
}
