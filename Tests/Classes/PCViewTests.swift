//
//  PCViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestView: PCView {

	var didCallSetupViews = false
	var didCallSetupLayout = false

	override func setupViews() {
		super.setupViews()

		didCallSetupViews = true
	}

	override func setupLayout() {
		super.setupLayout()

		didCallSetupLayout = true
	}

	var preferredPadding: CGFloat {
		return 10.0
	}

}

final class PCViewTests: XCTestCase {

	func testInit() {
		let view = TestView()
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitWithFrame() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let pcView = PCView(frame: frame)
		XCTAssertEqual(pcView.frame, frame)
		XCTAssertEqual(pcView.preferredPadding, 20)

		let view = TestView(frame: frame)
		XCTAssertEqual(view.frame, frame)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcView = PCView(coder: coder)
		XCTAssertNotNil(pcView)
		XCTAssertEqual(pcView!.preferredPadding, 20)

		let view = TestView(coder: coder)
		XCTAssertNotNil(view)
		XCTAssert(view!.didCallSetupViews)
		XCTAssert(view!.didCallSetupLayout)
		XCTAssertEqual(view!.backgroundColor, .white)
		XCTAssertEqual(view!.preferredPadding, 10)
	}

	func testConvenienceInit() {
		let view1 = PCView(backgroundColor: .red)
		XCTAssertEqual(view1.backgroundColor, .red)

		let view2 = PCView(backgroundColor: nil)
		XCTAssertNil(view2.backgroundColor)
	}

}
