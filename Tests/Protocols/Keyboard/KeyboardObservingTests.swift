//
//  KeyboardObservingTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestViewController: PCViewController, KeyboardObserving {

	var didObserveKeyboardWillShow = false
	var didObserveKeyboardDidShow = false
	var didObserveKeyboardWillHide = false
	var didObserveKeyboardDidHide = false
	var didObserveKeyboardWillChangeFrame = false
	var didObserveKeyboardDidChangeFrame = false

	func keyboardWillShow(_ notification: KeyboardNotification?) {
		didObserveKeyboardWillShow = true
	}

	func keyboardDidShow(_ notification: KeyboardNotification?) {
		didObserveKeyboardDidShow = true
	}

	func keyboardWillHide(_ notification: KeyboardNotification?) {
		didObserveKeyboardWillHide = true
	}

	func keyboardDidHide(_ notification: KeyboardNotification?) {
		didObserveKeyboardDidHide = true
	}

	func keyboardWillChangeFrame(_ notification: KeyboardNotification?) {
		didObserveKeyboardWillChangeFrame = true
	}

	func keyboardDidChangeFrame(_ notification: KeyboardNotification?) {
		didObserveKeyboardDidChangeFrame = true
	}

}

final class KeyboardObservingTests: XCTestCase {

	func testObservingKeyboardNotifications() {
		let viewController = TestViewController()
		viewController.registerForKeyboardEvents()

		NotificationCenter.default.post(name: .UIKeyboardWillShow, object: nil)
		XCTAssert(viewController.didObserveKeyboardWillShow)

		NotificationCenter.default.post(name: .UIKeyboardDidShow, object: nil)
		XCTAssert(viewController.didObserveKeyboardDidShow)

		NotificationCenter.default.post(name: .UIKeyboardWillHide, object: nil)
		XCTAssert(viewController.didObserveKeyboardWillHide)

		NotificationCenter.default.post(name: .UIKeyboardDidHide, object: nil)
		XCTAssert(viewController.didObserveKeyboardDidHide)

		NotificationCenter.default.post(name: .UIKeyboardWillChangeFrame, object: nil)
		XCTAssert(viewController.didObserveKeyboardWillChangeFrame)

		NotificationCenter.default.post(name: .UIKeyboardDidChangeFrame, object: nil)
		XCTAssert(viewController.didObserveKeyboardDidChangeFrame)
	}

}
