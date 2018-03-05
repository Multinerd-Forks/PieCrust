//
//  PCShadowable.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to PCShadowable protocol to set shadow related propertoes for views.
public protocol PCShadowable: class {

	/// Shadow color of view.
	var shadowColor: UIColor? { get set }

	/// Shadow offset of view.
	var shadowOffset: CGSize { get set }

	/// Shadow opacity of view.
	var shadowOpacity: Float { get set }

	/// Shadow radius of view.
	var shadowRadius: CGFloat { get set }

    /// Set shadow properties for a view.
    ///
    /// - Parameters:
    ///   - color: Shadow color of view.
    ///   - offset: Shadow offset of view.
    ///   - opacity: Shadow opacity of view.
    ///   - radius: Shadow radius of view.
	func setShadow(color: UIColor?, offset: CGSize, opacity: Float, radius: CGFloat)

}

public extension PCShadowable where Self: UIView {

	/// Shadow color of view.
	public var shadowColor: UIColor? {
		get {
			guard let color = layer.shadowColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
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
        clipsToBounds = false
	}

}
