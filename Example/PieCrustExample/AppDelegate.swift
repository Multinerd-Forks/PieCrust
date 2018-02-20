//
//  AppDelegate.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 9.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()

        showAuthController(animated: false)

		return true
	}

}

extension AppDelegate {

    func showAuthController(animated: Bool = true) {
        window?.switchRootViewController(NavigationController(rootViewController: AuthViewController()), animated: animated)
    }

    func showTabController(animated: Bool = true) {
        window?.switchRootViewController(TabBarController(), animated: animated)
    }
}
