//
//  MainWindow.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//

import UIKit

class MainWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitTestResult = super.hitTest(point, with: event)
        if hitTestResult == rootViewController?.view {
            return nil
        }
        return hitTestResult
    }
}
