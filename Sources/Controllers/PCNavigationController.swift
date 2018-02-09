//
//  PCNavigationController.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class PCNavigationController: UINavigationController, PCAlertable, PCConfettiable {

	/// controller's custom TabBarController (if applicable)
	open var customTabBarController: PCTabBarController? {
		return tabBarController as? PCTabBarController
	}

}
