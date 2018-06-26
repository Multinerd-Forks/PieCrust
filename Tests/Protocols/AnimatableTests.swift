//
//  AnimatableTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class AnimatableTests: XCTestCase {

	let view = PCView()

	override func setUp() {
		super.setUp()

		view.alpha = 1
		view.transform = .identity
	}

	func testFadeIn() {
		view.alpha = 0
		view.fadeIn(withDuration: 0, delay: 0, completion: nil)
		XCTAssertEqual(view.alpha, 1)
	}

	func testFadeInWithDuration() {
		view.alpha = 0
		let fadeInExpectation = expectation(description: "Faded in")
		view.fadeIn(withDuration: 0.5, delay: 0.5) { _ in
			fadeInExpectation.fulfill()
		}
		XCTAssertEqual(view.alpha, 1)
		waitForExpectations(timeout: 1, handler: nil)
	}

	func testFadeOut() {
		view.fadeOut(withDuration: 0, delay: 0, completion: nil)
		XCTAssertEqual(view.alpha, 0)
	}

	func testFadeOutWithDuration() {
		let fadeOutExpectation = expectation(description: "Faded out")
		view.fadeOut(withDuration: 0.5, delay: 0.5) { _ in
			fadeOutExpectation.fulfill()
		}
		XCTAssertEqual(view.alpha, 0)
		waitForExpectations(timeout: 1, handler: nil)
	}

	func testPopIn() {
		view.popIn(withDuration: 0, delay: 0, completion: nil)
		XCTAssertEqual(view.transform, .init(scaleX: 0.95, y: 0.95))
	}

	func testPopInWithDuration() {
		let popInExpectation = expectation(description: "Popped in")
		view.popIn(withDuration: 0.5, delay: 0.5) { _ in
			popInExpectation.fulfill()
		}
		XCTAssertEqual(view.transform, .init(scaleX: 0.95, y: 0.95))
		waitForExpectations(timeout: 1, handler: nil)
	}

	func testPopOut() {
		view.transform = .init(scaleX: 0.5, y: 0.5)
		view.popOut(withDuration: 0, delay: 0, completion: nil)
		XCTAssertEqual(view.transform, .identity)
	}

	func testPopOutWithDuration() {
		let popOutExpectation = expectation(description: "Popped out")
		view.popOut(withDuration: 0.5, delay: 0.5) { _ in
			popOutExpectation.fulfill()
		}
		XCTAssertEqual(view.transform, .identity)
		waitForExpectations(timeout: 1, handler: nil)
	}

	func testShake() {
		let shakeExpectation = expectation(description: "Shaked")
		view.shake(withDuration: 2, delay: 0) {
			shakeExpectation.fulfill()
		}
		XCTAssertEqual(view.transform, .identity)
		waitForExpectations(timeout: 2, handler: nil)
	}

}
