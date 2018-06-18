//
//  AlertPresenting.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to `AlertPresenting` protocol to present alerts from a view controller.
public protocol AlertPresenting: AnyObject {

	/// Present alert.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - message: alert message.
	///   - preferredStyle: alert preferred style.
	///   - tintColor: alert tint color.
	///   - actions: alert actions array.
	///   - animated: set to true to animate alert presentation.
	///   - completion: optional completion handler is called after the alert is presented.
	/// - Returns: presented alert.
	@discardableResult func presentAlert(
		title: String?,
		message: String?,
		preferredStyle: UIAlertControllerStyle,
		tintColor: UIColor?,
		actions: [UIAlertAction],
		animated: Bool,
		completion: (() -> Void)?) -> UIAlertController

	/// Present alert from an error.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - error: error.
	///   - preferredStyle: alert preferred style.
	///   - tintColor: alert tint color.
	///   - actions: alert actions array.
	///   - animated: set to true to animate alert presentation.
	///   - completion: optional completion handler is called after the alert is presented.
	/// - Returns: presented alert.
	@discardableResult func presentAlert(
		title: String?,
		error: Error,
		preferredStyle: UIAlertControllerStyle,
		tintColor: UIColor?,
		actions: [UIAlertAction],
		animated: Bool,
		completion: (() -> Void)?) -> UIAlertController

}

// MARK: - Default implementation for UIViewController.
public extension AlertPresenting where Self: UIViewController {

	/// Present alert.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - message: alert message.
	///   - preferredStyle: alert preferred style _(default is .alert)_.
	///   - tintColor: alert tint color _(default is nil)_.
	///   - actions: alert actions array _(default is empty)_.
	///   - animated: set to true to animate alert presentation _(defalt is true)_.
	///   - completion: optional completion handler is called after the alert is presented _(default is nil)_.
	/// - Returns: presented alert.
	@discardableResult public func presentAlert(
		title: String?,
		message: String?,
		preferredStyle: UIAlertControllerStyle = .alert,
		tintColor: UIColor? = nil,
		actions: [UIAlertAction] = [],
		animated: Bool = true,
		completion: (() -> Void)? = nil) -> UIAlertController {

		let alert = self.alert(title: title, message: message, preferredStyle: preferredStyle, actions: actions, animated: animated)

		if let color = tintColor {
			alert.view.tintColor = color
		}

		present(alert, animated: animated, completion: completion)

		if let color = tintColor {
			alert.view.tintColor = color
		}

		return alert
	}

	/// Present alert from an error.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - error: error.
	///   - preferredStyle: alert preferred style _(default is .alert)_.
	///   - tintColor: alert tint color _(default is nil)_.
	///   - actions: alert actions array _(default is empty)_.
	///   - animated: set to true to animate alert presentation _(defalt is true)_.
	///   - completion: optional completion handler is called after the alert is presented _(default is nil)_.
	/// - Returns: presented alert.
	@discardableResult public func presentAlert(
		title: String?,
		error: Error,
		preferredStyle: UIAlertControllerStyle = .alert,
		tintColor: UIColor? = nil,
		actions: [UIAlertAction] = [],
		animated: Bool = true,
		completion: (() -> Void)? = nil) -> UIAlertController {

		let alert = self.alert(title: title, message: error.localizedDescription, preferredStyle: preferredStyle, actions: actions, animated: animated)

		if let color = tintColor {
			alert.view.tintColor = color
		}

		present(alert, animated: animated, completion: completion)

		if let color = tintColor {
			alert.view.tintColor = color
		}

		return alert
	}

}

// MARK: - Private UIViewController extension to show alerts.
private extension UIViewController {

	/// Creates an alert.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - message: alert message.
	///   - preferredStyle: alert preferred style _(default is .alert)_.
	///   - actions: alert actions array _(default is empty)_.
	///   - animated: wether presentation is animated or not _(default is true)_.
	/// - Returns: UIAlertController instance.
	@discardableResult func alert(
		title: String? = nil,
		message: String? = nil,
		preferredStyle: UIAlertControllerStyle = .alert,
		actions: [UIAlertAction] = [],
		animated: Bool = true) -> UIAlertController {

		let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

		if actions.isEmpty {
			let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alert.addAction(okAction)
		}

		for action in actions {
			alert.addAction(action)
		}

		return alert
	}

}
