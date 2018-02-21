//
//  PCTabBarController.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCTabBarController.
open class PCTabBarController: UITabBarController, PCAlertable, PCConfettiable {

    /// Called after the controller's view is loaded into memory.
	open override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = PCColor.white
	}

}
