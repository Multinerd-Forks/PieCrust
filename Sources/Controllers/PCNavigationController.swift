//
//  PCNavigationController.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCNavigationController.
open class PCNavigationController: UINavigationController, PCAlertable, PCConfettiable {

	/// controller's PCTabBarController (if applicable)
	open var pcTabBarController: PCTabBarController? {
		return tabBarController as? PCTabBarController
	}

	open override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white
	}

}
