//
//  AlertPresentingTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestViewController: PCViewController, AlertPresenting {}

private enum TestError: LocalizedError {
	case error

	var errorDescription: String? {
		return "error"
	}

	var localizedDescription: String {
		return "error"
	}

}

final class AlertPresentingTests: XCTestCase {

	let alertTitle = "Alert"
	let alertMessage = "Hey there, I'm an alert :)"
	let alertOption = "Got it!"

	func testPresentAlertWithTitle() {
		let viewController = TestViewController()

		let alert = viewController.presentAlert(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet, tintColor: .red)
		XCTAssertNotNil(alert.title)
		XCTAssertEqual(alert.title!, alertTitle)

		XCTAssertNotNil(alert.message)
		XCTAssertEqual(alert.message!, alertMessage)

		XCTAssertEqual(alert.preferredStyle, .actionSheet)
		XCTAssertEqual(alert.view.tintColor, UIColor.red)
	}

	func testPresentAlertWithError() {
		let viewController = TestViewController()
		let alertAction = UIAlertAction(title: alertOption, style: .cancel)

		let alert = viewController.presentAlert(
			title: alertTitle,
			error: TestError.error,
			preferredStyle: .actionSheet,
			tintColor: .red,
			actions: [alertAction])

		XCTAssertNotNil(alert.title)
		XCTAssertEqual(alert.title!, alertTitle)

		XCTAssertNotNil(alert.message!)
		XCTAssertEqual(alert.message!, TestError.error.localizedDescription)

		XCTAssertEqual(alert.preferredStyle, .actionSheet)
		XCTAssertEqual(alert.view.tintColor, UIColor.red)
		XCTAssertEqual(alert.actions, [alertAction])
	}

}
