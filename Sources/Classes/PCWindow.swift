//
//  PCWindow.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCWindow.
///
/// - Conforms to:
///   - `Crustable`
open class PCWindow: UIWindow, Crustable {}

// MARK: - Default implementation for UIWindow.
public extension Crustable where Self: UIWindow {

	/// Create a PCWindow and set its rootViewController in one line.
	///
	/// - Parameter rootViewController: The root view controller for the window.
	public init(rootViewController: UIViewController) {
		self.init()

		self.rootViewController = rootViewController
		self.makeKeyAndVisible()
	}

	/// Switch current root view controller with a new view controller.
	///
	/// - Parameters:
	///   - viewController: new view controller.
	///   - animated: set to true to animate view controller change _(default is true)_.
	///   - duration: animation duration in seconds _(default is 0.5)_.
	///   - options: animataion options _(default is .transitionFlipFromRight)_.
	///   - completion: optional completion handler called when view controller is changed.
	public func switchRootViewController(
		to viewController: UIViewController,
		animated: Bool = true,
		duration: TimeInterval = 0.5,
		options: UIViewAnimationOptions = .transitionFlipFromRight,
		_ completion: (() -> Void)? = nil) {

		guard animated else {
			rootViewController = viewController
			return
		}

		UIView.transition(with: self, duration: duration, options: options, animations: {
			let oldState = UIView.areAnimationsEnabled
			UIView.setAnimationsEnabled(false)
			self.rootViewController = viewController
			UIView.setAnimationsEnabled(oldState)
		}, completion: { _ in
			completion?()
		})
	}

}

// MARK: - Default implementation for UIResponder & UIApplicationDelegate.
public extension Crustable where Self: UIResponder & UIApplicationDelegate {

	/// Return UIWindow as PCWindow
	public var pcWindow: PCWindow? {
		guard let aWindow = window as? PCWindow else {
			fatalError("window property has not been inialized yet, or not initialized as a PCWindow.")
		}
		return aWindow
	}

}
