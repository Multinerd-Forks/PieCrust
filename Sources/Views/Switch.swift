//
//  Switch.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 8.02.2018.
//

import UIKit

/// Custom UISwitch.
open class Switch: UISwitch, Animatable {

	/// Toggle Switch.
	///
	/// - Parameter animated: set true to animate the change (default is true).
	open func toggle(animated: Bool = true) {
		setOn(!isOn, animated: animated)
	}

}
