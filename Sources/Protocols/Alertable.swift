//
//  Alertable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

public protocol Alertable: class {
	@discardableResult
	func presentAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], animated: Bool, completion: (() -> Void)?) -> UIAlertController
	
	@discardableResult
	func presentAlert(title: String?, error: Error, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], animated: Bool, completion: (() -> Void)?) -> UIAlertController
}

public extension Alertable where Self: UIViewController {
	
	@discardableResult
	public func presentAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle = .alert, actions: [UIAlertAction] = [], animated: Bool = true, completion: (() -> Void)? = nil) -> UIAlertController {
		
		let alert = self.alert(title: title, message: message, preferredStyle: preferredStyle, actions: actions, animated: animated)
		present(alert, animated: animated, completion: completion)
		return alert
	}

	@discardableResult
	public func presentAlert(title: String?, error: Error, preferredStyle: UIAlertControllerStyle = .alert, actions: [UIAlertAction] = [], animated: Bool = true, completion: (() -> Void)? = nil) -> UIAlertController {
		
		let alert = self.alert(title: title, message: error.localizedDescription, preferredStyle: preferredStyle, actions: actions, animated: animated)
		present(alert, animated: animated, completion: completion)
		return alert
	}
}
