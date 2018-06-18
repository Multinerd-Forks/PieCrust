//
//  BorderableTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class BorderableTests: XCTestCase {

	func testCornerRadius() {
		let view = PCView()
		XCTAssertEqual(view.cornerRadius, 0)
		XCTAssertFalse(view.clipsToBounds)

		view.cornerRadius = 10
		XCTAssert(view.clipsToBounds)
		XCTAssertEqual(view.layer.cornerRadius, 10)
	}

	func testBorderWidth() {
		let view = PCView()
		XCTAssertEqual(view.borderWidth, 0)

		view.borderWidth = 10
		XCTAssertEqual(view.layer.borderWidth, 10)
	}

	func testBorderColor() {
		let view = PCView()

		view.borderColor = nil
		XCTAssertNil(view.borderColor)

		view.borderColor = .red
		XCTAssertNotNil(view.borderColor)
		XCTAssertEqual(view.layer.borderColor!, UIColor.red.cgColor)
	}

	func testSetBorder() {
		let view = PCView()

		view.setBorder(width: 5, color: .green, radius: 10)

		XCTAssertEqual(view.layer.borderWidth, 5)
		XCTAssert(view.clipsToBounds)
		XCTAssertEqual(view.layer.borderColor!, UIColor.green.cgColor)
		XCTAssertEqual(view.layer.cornerRadius, 10)
	}

}
