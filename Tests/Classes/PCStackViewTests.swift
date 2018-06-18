//
//  PCStackViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCStackViewTests: XCTestCase {

	let views: [UIView] = [UIView(), UILabel()]

	func testConvenienceInit() {
		let stackView = PCStackView(arrangedSubviews: views, axis: .horizontal, alignment: .center, distribution: .equalSpacing, spacing: 0.5)

		XCTAssertEqual(stackView.arrangedSubviews, views)
		XCTAssertEqual(stackView.axis, .horizontal)
		XCTAssertEqual(stackView.alignment, .center)
		XCTAssertEqual(stackView.distribution, .equalSpacing)
		XCTAssertEqual(stackView.spacing, 0.5)
	}

	func testRemoveArrangedSubviews() {
		let stackView = PCStackView(arrangedSubviews: views)
		XCTAssertEqual(stackView.arrangedSubviews, views)

		stackView.removeArrangedSubviews()
		XCTAssert(stackView.arrangedSubviews.isEmpty)
	}

}
