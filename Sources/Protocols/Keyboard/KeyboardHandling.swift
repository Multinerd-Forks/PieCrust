//
//  KeyboardHandling.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

public protocol KeyboardHandling: AnyObject {

	/// Call this method from view contoller to handle KeyboardWillShow notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func keyboardWillShow(_ notification: KeyboardNotification?)

	/// Call this method from view contoller to handle handleKeyboardDidShow notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func keyboardDidShow(_ notification: KeyboardNotification?)

	/// Call this method from view contoller to handle handleKeyboardWillHide notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func keyboardWillHide(_ notification: KeyboardNotification?)

	/// Call this method from view contoller to handle handleKeyboardDidHide notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func keyboardDidHide(_ notification: KeyboardNotification?)

	/// Call this method from view contoller to handle handleKeyboardWillChangeFrame notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func keyboardWillChangeFrame(_ notification: KeyboardNotification?)

	/// Call this method from view contoller to handle handleKeyboardDidChangeFrame notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	func keyboardDidChangeFrame(_ notification: KeyboardNotification?)

}
