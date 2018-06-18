//
//  PCSwitch.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCSwitch.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCSwitch: UISwitch, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UISwitch.
public extension Crustable where Self: UISwitch {

	/// Toggle Switch.
	///
	/// - Parameter animated: set true to animate the change _(default is true)_.
	public func toggle(animated: Bool = true) {
		setOn(!isOn, animated: animated)
	}

}
