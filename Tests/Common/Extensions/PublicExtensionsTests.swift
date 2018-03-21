//
//  PublicExtensionsTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
import UIKit
import SwifterSwift

class PublicExtensionsTests: XCTestCase {

    func testSwitchRootViewController() {
        let window = UIWindow()
        let viewController = UIViewController()
        window.switchRootViewController(viewController, animated: true, duration: 0.6, options: .transitionCurlDown) {
            print("hello world")
        }

    }

    func testKeyboardSize() {
        let notification = Notification(name: Notification.Name(rawValue: "notify"))
    }

}
