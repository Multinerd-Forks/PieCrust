//
//  PCKeyboardControllable.swift
//  PieCrust
//
//  Created by Omar Albeik on 2/23/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

public protocol PCKeyboardControllable: class {

	/// Call this method from view contoller to handle KeyboardWillShow notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func handleKeyboardWillShow(_ notification: Notification)

	/// Call this method from view contoller to handle handleKeyboardDidShow notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func handleKeyboardDidShow(_ notification: Notification)

	/// Call this method from view contoller to handle handleKeyboardWillHide notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func handleKeyboardWillHide(_ notification: Notification)

	/// Call this method from view contoller to handle handleKeyboardDidHide notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func handleKeyboardDidHide(_ notification: Notification)

	/// Call this method from view contoller to handle handleKeyboardWillChangeFrame notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func handleKeyboardWillChangeFrame(_ notification: Notification)

	/// Call this method from view contoller to handle handleKeyboardDidChangeFrame notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func handleKeyboardDidChangeFrame(_ notification: Notification)

}
