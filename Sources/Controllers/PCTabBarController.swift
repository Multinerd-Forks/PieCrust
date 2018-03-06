//
//  PCTabBarController.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCTabBarController.
///
/// - Conforms to:
///   - PCrustable
///   - PCAlertable
///   - PCConfettiable
open class PCTabBarController: UITabBarController, PCAlertable, PCConfettiable {

    /// Called after the controller's view is loaded into memory.
	open override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = PCColor.white
	}

}
