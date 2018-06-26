//
//  Layouting.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to Layouting protocol from a view controller to use pcView property.
public protocol Layouting: AnyObject {

	/// PCView.
	associatedtype View: PCView

	/// view as PCView.
	var pcView: View { get }

}

// MARK: - Default implementation for UIViewController.
public extension Layouting where Self: UIViewController {

	/// view as PCView.
	public var pcView: View {
		guard let aView = view as? View else {
			fatalError("view property has not been inialized yet, or not initialized as a \(View.self).")
		}
		return aView
	}

}
