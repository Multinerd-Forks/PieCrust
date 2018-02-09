//
//  PCSwitch.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//

import UIKit

/// PCSwitch.
open class PCSwitch: UISwitch, PCAnimatable {

	/// Toggle Switch.
	///
	/// - Parameter animated: set true to animate the change (default is true).
	open func toggle(animated: Bool = true) {
		setOn(!isOn, animated: animated)
	}

}
