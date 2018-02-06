//
//  Borderable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit

public protocol Borderable: class {
	var cornerRadius: CGFloat { get set }
	var borderWidth: CGFloat { get set }
	var borderColor: UIColor? { get set }
}

public extension Borderable where Self: UIView {
	
	public var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}
	
	public var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
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
