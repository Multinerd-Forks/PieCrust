//
//  PCActivityIndicatorView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCActivityIndicatorView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCActivityIndicatorView: UIActivityIndicatorView, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UIActivityIndicatorView.
public extension Crustable where Self: UIActivityIndicatorView {

	/// Creates and returns a new UIActivityIndicatorView with setting its properties in one line.
	///
	/// - Parameters:
	///   - activityIndicatorStyle: The basic appearance of the activity indicator _(default is .white)_.
	///   - hidesWhenStopped: A Boolean value that controls whether the receiver is hidden when the animation is stopped _(default is true)_.
	///   - color: The color of the activity indicator.
	public init(
		activityIndicatorStyle: UIActivityIndicatorViewStyle = .white,
		hidesWhenStopped: Bool = true,
		color: UIColor?) {

		self.init(activityIndicatorStyle: activityIndicatorStyle)

		self.hidesWhenStopped = hidesWhenStopped
		self.color = color
	}

}
