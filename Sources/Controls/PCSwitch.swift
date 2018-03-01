//
//  PCSwitch.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCSwitch.
///
/// - Conforms to:
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCSwitch: UISwitch, PCAnimatable, PCBorderable, PCShadowable {

	/// Toggle Switch.
	///
	/// - Parameter animated: set true to animate the change (default is true).
	open func toggle(animated: Bool = true) {
		setOn(!isOn, animated: animated)
	}

}
