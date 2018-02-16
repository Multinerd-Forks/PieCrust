//
//  PCAlertable.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to PCAlertable protocol to present alerts from a view controller.
public protocol PCAlertable: class {

	@discardableResult
	/// Present alert.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - message: alert message.
	///   - preferredStyle: alert preferred style.
	///   - actions: alert actions array.
	///   - animated: set to true to animate alert presentation.
	///   - completion: optional completion handler is called after the alert is presented.
	/// - Returns: presented alert.
	func presentAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], animated: Bool, completion: (() -> Void)?) -> UIAlertController

	@discardableResult
	/// Present alert from an error.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - error: error.
	///   - preferredStyle: alert preferred style.
	///   - actions: alert actions array.
	///   - animated: set to true to animate alert presentation.
	///   - completion: optional completion handler is called after the alert is presented.
	/// - Returns: presented alert.
	func presentAlert(title: String?, error: Error, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], animated: Bool, completion: (() -> Void)?) -> UIAlertController

}

public extension PCAlertable where Self: UIViewController {

	@discardableResult
	/// Present alert.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - message: alert message.
	///   - preferredStyle: alert preferred style (default is .alert).
	///   - actions: alert actions array (default is []).
	///   - animated: set to true to animate alert presentation (defalt is true).
	///   - completion: optional completion handler is called after the alert is presented (default is nil).
	/// - Returns: presented alert.
	public func presentAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle = .alert, actions: [UIAlertAction] = [], animated: Bool = true, completion: (() -> Void)? = nil) -> UIAlertController {

		let alert = self.alert(title: title, message: message, preferredStyle: preferredStyle, actions: actions, animated: animated)
		present(alert, animated: animated, completion: completion)
		return alert
	}

	@discardableResult
	/// Present alert from an error.
	///
	/// - Parameters:
	///   - title: alert title.
	///   - error: error.
	///   - preferredStyle: alert preferred style (default is .alert).
	///   - actions: alert actions array (default is []).
	///   - animated: set to true to animate alert presentation (defalt is true).
	///   - completion: optional completion handler is called after the alert is presented (default is nil).
	/// - Returns: presented alert.
	public func presentAlert(title: String?, error: Error, preferredStyle: UIAlertControllerStyle = .alert, actions: [UIAlertAction] = [], animated: Bool = true, completion: (() -> Void)? = nil) -> UIAlertController {

		let alert = self.alert(title: title, message: error.localizedDescription, preferredStyle: preferredStyle, actions: actions, animated: animated)
		present(alert, animated: animated, completion: completion)
		return alert
	}

}
