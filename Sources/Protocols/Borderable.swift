//
//  Borderable.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to `Borderable` protocol to set border reloated properties for views.
public protocol Borderable: AnyObject {}

// MARK: - Default implementation for UIView.
public extension Borderable where Self: UIView {

	/// View corner radius.
	public var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			clipsToBounds = true
			layer.cornerRadius = newValue
		}
	}

	/// View border width.
	public var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	/// View border color.
	public var borderColor: UIColor? {
		get {
			guard let color = layer.borderColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
			layer.borderColor = newValue?.cgColor
		}
	}

	/// Set border properties for a view.
	///
	/// - Parameters:
	///   - width: View border width _(default is nil)_.
	///   - color: View border color _(default is nil)_.
	///   - radius: View corner radius _(default is nil)_.
	public func setBorder(width: CGFloat? = nil, color: UIColor? = nil, radius: CGFloat? = nil) {
		if let borderWidth = width {
			self.borderWidth = borderWidth
		}

		self.borderColor = color

		if let cornerRadius = radius {
			self.cornerRadius = cornerRadius
		}
	}

}
