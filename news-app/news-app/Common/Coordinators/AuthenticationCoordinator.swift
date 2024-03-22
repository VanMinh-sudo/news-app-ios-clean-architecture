//
//  AuthenticationCoordinator.swift
//  news-app
//
//  Created by minhnv1 on 20/03/2024.
//

import Foundation

class AuthenticationCoordinator: NSObject, Coordinator {
    public var children: [Coordinator] = []
    public let router: Router

    var signInViewController: SignInViewController!

    public init(router: Router) {
        self.router = router
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {

    }
}
