//
//  Shadowable.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to `Shadowable` protocol to set shadow related propertoes for views.
public protocol Shadowable: AnyObject {}

// MARK: - Default implementation for UIView.
public extension Shadowable where Self: UIView {

	/// Shadow color of view.
	public var shadowColor: UIColor? {
		get {
			guard let color = layer.shadowColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
			layer.masksToBounds = false
			layer.shadowColor = newValue?.cgColor
			layer.shouldRasterize = true
			layer.rasterizationScale = UIScreen.main.scale
		}
	}

	/// Shadow offset of view.
	public var shadowOffset: CGSize {
		get {
			return layer.shadowOffset
		}
		set {
			layer.masksToBounds = false
			layer.shadowOffset = newValue
			layer.shouldRasterize = true
			layer.rasterizationScale = UIScreen.main.scale
		}
	}

	/// Shadow opacity of view.
	public var shadowOpacity: Float {
		get {
			return layer.shadowOpacity
		}
		set {
			layer.masksToBounds = false
			layer.shadowOpacity = newValue
			layer.shouldRasterize = true
			layer.rasterizationScale = UIScreen.main.scale
		}
	}

	/// Shadow radius of view.
	public var shadowRadius: CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.masksToBounds = false
			layer.shadowRadius = newValue
			layer.shouldRasterize = true
			layer.rasterizationScale = UIScreen.main.scale
		}
	}

	/// Set view's shadow
	///
	/// - Parameters:
	///   - color: Shadow color of view.
	///   - offset: Shadow offset of view.
	///   - opacity: Shadow opacity of view.
	///   - radius: Shadow radius of view.
	public func setShadow(color: UIColor?, offset: CGSize, opacity: Float, radius: CGFloat) {
		shadowColor = color
		shadowOffset = offset
		shadowOpacity = opacity
		shadowRadius = radius
	}

}
