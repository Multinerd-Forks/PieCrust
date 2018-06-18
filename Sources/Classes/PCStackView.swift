//
//  PCStackView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCStackView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCStackView: UIStackView, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UIStackView.
public extension Crustable where Self: UIStackView {

	/// Creates and returns a new UIStackView with setting its properties in one line.
	///
	/// - Parameters:
	///   - arrangedSubviews: Initial arrangedSubviews array _(default is [])_.
	///   - axis: The axis along which the arranged views are laid out.
	///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis _(default is .fill)_.
	///   - distribution: The distribution of the arranged views along the stack view’s axis _(default is .fill)_.
	///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views _(default is 0.0)_.
	public init(
		arrangedSubviews: [UIView] = [],
		axis: UILayoutConstraintAxis,
		alignment: UIStackViewAlignment = .fill,
		distribution: UIStackViewDistribution = .fill,
		spacing: CGFloat = 0.0) {

		self.init(arrangedSubviews: arrangedSubviews)

		self.axis = axis
		self.alignment = alignment
		self.distribution = distribution
		self.spacing = spacing
	}

	/// Remove all arranged subviews.
	public func removeArrangedSubviews() {
		for view in arrangedSubviews {
			view.removeFromSuperview()
			removeArrangedSubview(view)
		}
	}

}
