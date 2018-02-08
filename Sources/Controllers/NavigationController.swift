//
//  NavigationController.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class NavigationController: UINavigationController, Alertable, Confettiable {

	/// controller's custom TabBarController (if applicable)
	open var customTabBarController: TabBarController? {
		return tabBarController as? TabBarController
	}

}
