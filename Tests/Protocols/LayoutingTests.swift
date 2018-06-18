//
//  LayoutingTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestView: PCView {}

private final class TestViewController: PCViewController, Layouting {
	typealias View = TestView

	override func loadView() {
		view = View()
	}

}

final class LayoutingTests: XCTestCase {

	func testPcView() {
		let viewController = TestViewController()
		let testView = viewController.view as? TestView
		XCTAssertNotNil(testView)
		XCTAssertEqual(viewController.pcView, testView!)
	}

}
