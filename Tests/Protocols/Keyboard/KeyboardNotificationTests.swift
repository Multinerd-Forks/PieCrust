//
//  KeyboardNotificationTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class KeyboardNotificationTests: XCTestCase {

	let startFrame = CGRect(x: 0, y: 0, width: 20, height: 10)
	let endFrame = CGRect(x: 0, y: 0, width: 200, height: 100)
	let animationCurve = UIViewAnimationCurve.easeInOut
	let animationDuration = TimeInterval(0.5)
	let isLocalUser = false

	var userInfo: [String: Any] {
		return [
			UIKeyboardFrameBeginUserInfoKey: startFrame,
			UIKeyboardFrameEndUserInfoKey: endFrame,
			UIKeyboardAnimationDurationUserInfoKey: animationDuration,
			UIKeyboardIsLocalUserInfoKey: isLocalUser,
			UIKeyboardAnimationCurveUserInfoKey: animationCurve.rawValue
		]
	}

	func testInit() {
		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: userInfo)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNotNil(keyboardNotification)

		XCTAssertEqual(keyboardNotification!.startFrame, startFrame)
		XCTAssertEqual(keyboardNotification!.endFrame, endFrame)
		XCTAssertEqual(keyboardNotification!.animationCurve, animationCurve)
		XCTAssertEqual(keyboardNotification!.animationDuration, animationDuration)
		XCTAssertEqual(keyboardNotification!.isLocalUser, isLocalUser)
	}

	func testInitWithoutUserInfo() {
		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: nil)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNil(keyboardNotification)
	}

	func testInitWithoutStartFrame() {
		var invalidUserInfo = userInfo
		invalidUserInfo[UIKeyboardFrameBeginUserInfoKey] = "test"

		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: invalidUserInfo)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNil(keyboardNotification)
	}

	func testInitWithoutEndFrame() {
		var invalidUserInfo = userInfo
		invalidUserInfo[UIKeyboardFrameEndUserInfoKey] = "test"

		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: invalidUserInfo)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNil(keyboardNotification)
	}

	func testInitWithoutAnimationDuration() {
		var invalidUserInfo = userInfo
		invalidUserInfo[UIKeyboardAnimationDurationUserInfoKey] = "test"

		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: invalidUserInfo)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNil(keyboardNotification)
	}

	func testInitWithoutIsLocal() {
		var invalidUserInfo = userInfo
		invalidUserInfo[UIKeyboardIsLocalUserInfoKey] = "test"

		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: invalidUserInfo)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNil(keyboardNotification)
	}

	func testInitWithoutAnimationCurve() {
		var invalidUserInfo = userInfo
		invalidUserInfo[UIKeyboardAnimationCurveUserInfoKey] = "test"

		let notification = Notification(name: .UIKeyboardWillShow, object: nil, userInfo: invalidUserInfo)
		let keyboardNotification = KeyboardNotification(notification: notification)
		XCTAssertNotNil(keyboardNotification)
	}

}
