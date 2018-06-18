//
//  ShadowableTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class ShadowableTests: XCTestCase {

	func testShadowColor() {
		let view = PCView()
		view.layer.shadowColor = nil
		XCTAssertNil(view.shadowColor)
		view.shadowColor = .orange
		XCTAssertNotNil(view.layer.shadowColor)
		XCTAssertEqual(view.shadowColor!, .orange)
	}

	func testShadowOffset() {
		let view = PCView()
		view.layer.shadowOffset = .zero
		XCTAssertEqual(view.shadowOffset, .zero)
		let size = CGSize(width: 5, height: 5)
		view.shadowOffset = size
		XCTAssertEqual(view.layer.shadowOffset, size)
	}

	func testShadowOpacity() {
		let view = PCView()
		view.layer.shadowOpacity = 0
		XCTAssertEqual(view.shadowOpacity, 0)
		view.shadowOpacity = 0.5
		XCTAssertEqual(view.layer.shadowOpacity, 0.5)
	}

	func testShadowRadius() {
		let view = PCView()
		view.layer.shadowRadius = 0
		XCTAssertEqual(view.shadowRadius, 0)
		view.shadowRadius = 0.5
		XCTAssertEqual(view.layer.shadowRadius, 0.5)
	}

	func testSetShadow() {
		let offset = CGSize(width: 8, height: 10)
		let view = PCView()
		view.setShadow(color: .blue, offset: offset, opacity: 0.05, radius: 10)
		XCTAssertEqual(view.shadowColor, .blue)
		XCTAssertEqual(view.shadowOffset, offset)
		XCTAssertEqual(view.shadowOpacity, 0.05)
		XCTAssertEqual(view.shadowRadius, 10)
	}

}
