//
//  ConfettiableTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestView: UIView, Confettiable {}

private final class TestViewController: UIViewController, Confettiable {}

final class ConfettiableTests: XCTestCase {

	func testShowConfettiForView() {
		let view = TestView()
		view.showConfetti(duration: 0.5, delay: 0)

		let confettiExpectation = expectation(description: "Showed confetti")
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
			XCTAssertEqual(view.subviews.count, 1)
			let confettiView = view.subviews.first as? PCConfettiView
			XCTAssertNotNil(confettiView)
			XCTAssertEqual(confettiView!.layer.zPosition, 100)
			XCTAssertEqual(confettiView!.isActive, true)
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + 5.75) {
			XCTAssertEqual(view.subviews.count, 0)
			confettiExpectation.fulfill()
		}

		waitForExpectations(timeout: 6, handler: nil)
	}

	func testShowConfettiForViewController() {
		let viewController = TestViewController()
		viewController.showConfetti(duration: 0.5, delay: 0)

		let confettiExpectation = expectation(description: "Showed confetti")
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
			XCTAssertEqual(viewController.view.subviews.count, 1)
			let confettiView = viewController.view.subviews.first as? PCConfettiView
			XCTAssertNotNil(confettiView)
			XCTAssertEqual(confettiView!.layer.zPosition, 100)
			XCTAssertEqual(confettiView!.isActive, true)
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + 5.75) {
			XCTAssertEqual(viewController.view.subviews.count, 0)
			confettiExpectation.fulfill()
		}

		waitForExpectations(timeout: 6, handler: nil)
	}

}
