//
//  PCConfettiViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestView: PCConfettiView {

	var didCallSetupViews = false

	override func setupViews() {
		super.setupViews()

		didCallSetupViews = true
	}

}

final class PCConfettiViewTests: XCTestCase {

	func testChangeBounds() {
		let view = TestView()

		view.bounds = .init(x: 0, y: 0, width: 100, height: 100)
		XCTAssert(view.didCallSetupViews)

		view.didCallSetupViews = false
		view.bounds = .init(x: 0, y: 0, width: 200, height: 200)
		XCTAssert(view.didCallSetupViews)
	}

	func testConvenienceInit() {
		let view1 = PCConfettiView(colors: [.red, .green], intensity: 0.75)
		XCTAssertEqual(view1.colors, [.red, .green])
		XCTAssertEqual(view1.intensity, 0.75)

		let view2 = PCConfettiView(intensity: 0.25)
		XCTAssertEqual(view2.colors.count, 5)
		XCTAssertEqual(view2.intensity, 0.25)

	}

}
