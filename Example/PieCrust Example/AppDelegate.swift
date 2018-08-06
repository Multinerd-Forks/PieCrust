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
class AppDelegate: UIResponder, UIApplicationDelegate, Crustable {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window = PCWindow(rootViewController: WelcomeViewController())

		return true
	}

	func showFeaturesViewController() {
		let navController = PCNavigationController(rootViewController: FeaturesViewController())
		pcWindow?.switchRootViewController(to: navController, animated: true, duration: 0.7, options: .transitionFlipFromRight)
	}

}

