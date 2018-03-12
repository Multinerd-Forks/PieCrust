//
//  NavigationController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class NavigationController: PCNavigationController {

	var pcTabBarController: TabBarController? {
		return tabBarController as? TabBarController
	}

}
