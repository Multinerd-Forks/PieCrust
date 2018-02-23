//
//  PCKeyboardable.swift
//  PieCrust
//
//  Created by Omar Albeik on 2/23/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// Conform to PCKeyboardObservable protocol to obbserve UIKeyboard events in a view controller.
public protocol PCKeyboardObservable: class {

	/// Called when .UIKeyboardWillShow notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardWillShow notification.
	func keyboardWillShow(_ notification: Notification)

	/// Called when .UIKeyboardDidShow notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardDidShow notification.
	func keyboardDidShow(_ notification: Notification)

	/// Called when .UIKeyboardWillHide notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardWillHide notification.
	func keyboardWillHide(_ notification: Notification)

	/// Called when .UIKeyboardDidHide notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardDidHide notification.
	func keyboardDidHide(_ notification: Notification)

	/// Called when .UIKeyboardWillChangeFrame notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardWillChangeFrame notification.
	func keyboardWillChangeFrame(_ notification: Notification)

	/// Called when .UIKeyboardDidChangeFrame notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardDidChangeFrame notification.
	func keyboardDidChangeFrame(_ notification: Notification)

	/// Register for UIKeyboard notifications.
	func registerForKeyboardEvents()

	/// Unregister from UIKeyboard notifications.
	func unregisterFromKeyboardEvents()

}

public extension PCKeyboardObservable where Self: UIViewController {

	/// Register for UIKeyboard notifications.
	func registerForKeyboardEvents() {
		_ = NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) { notification in
			self.keyboardWillShow(notification)
		}

		_ = NotificationCenter.default.addObserver(forName: .UIKeyboardDidShow, object: nil, queue: nil) { notification in
			self.keyboardDidShow(notification)
		}

		_ = NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) { notification in
			self.keyboardWillHide(notification)
		}

		_ = NotificationCenter.default.addObserver(forName: .UIKeyboardDidHide, object: nil, queue: nil) { notification in
			self.keyboardDidHide(notification)
		}

		_ = NotificationCenter.default.addObserver(forName: .UIKeyboardWillChangeFrame, object: nil, queue: nil) { notification in
			self.keyboardWillChangeFrame(notification)
		}

		_ = NotificationCenter.default.addObserver(forName: .UIKeyboardDidChangeFrame, object: nil, queue: nil) { notification in
			self.keyboardDidChangeFrame(notification)
		}

	}

	/// Unregister from UIKeyboard notifications.
	func unregisterFromKeyboardEvents() {
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidHide, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillChangeFrame, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidChangeFrame, object: nil)
	}

}
