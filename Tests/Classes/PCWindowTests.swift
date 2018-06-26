//
//  PCWindowTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class AppDelegate: UIResponder, UIApplicationDelegate, Crustable {
	var window: UIWindow?
}

final class PCWindowTests: XCTestCase {

	func testSwitchRootViewController() {
		let viewController = UIViewController()
		let tableViewController = UITableViewController()

		let window = PCWindow()
		window.rootViewController = viewController

		XCTAssertNotNil(window.rootViewController)
		XCTAssertEqual(window.rootViewController!, viewController)

		window.switchRootViewController(to: tableViewController, animated: false)
		XCTAssertNotNil(window.rootViewController)
		XCTAssertEqual(window.rootViewController!, tableViewController)

		let completionExpectation = expectation(description: "Completed")

		window.switchRootViewController(to: viewController, animated: true, duration: 0.75) {
			completionExpectation.fulfill()
			XCTAssertNotNil(window.rootViewController)
			XCTAssertEqual(window.rootViewController!, viewController)
		}

		waitForExpectations(timeout: 1, handler: nil)
	}

	func testPcWindow() {
		let delegate = AppDelegate()
		delegate.window = PCWindow()
		XCTAssertNotNil(delegate.pcWindow)
	}
}
