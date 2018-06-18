//
//  AppDelegate.swift
//  PieCrust Example
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import PieCrust

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow()
		window?.rootViewController = WelcomeViewController()
		window?.makeKeyAndVisible()

		return true
	}

	func showFeaturesViewController() {
		window?.switchRootViewController(FeaturesViewController(), animated: true, duration: 0.7, options: .transitionFlipFromRight)
	}

}

