//
//  Borderable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit

/// Conform to Borderable protocol to set border reloated properties for views.
public protocol Borderable: class {

	/// View corner radius.
	var cornerRadius: CGFloat { get set }

	/// View border width.
	var borderWidth: CGFloat { get set }

	/// View border color.
	var borderColor: UIColor? { get set }
}

public extension Borderable where Self: UIView {

	/// View corner radius.
	public var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
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
}
