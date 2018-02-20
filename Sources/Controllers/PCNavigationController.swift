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

	/// The nearest ancestor in the view controller hierarchy that is a PCTabBarController.
	open var pcTabBarController: PCTabBarController? {
		return tabBarController as? PCTabBarController
	}

    /// Called after the controller's view is loaded into memory.
	open override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white
	}

}
