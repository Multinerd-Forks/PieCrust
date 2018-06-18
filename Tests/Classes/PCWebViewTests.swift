//
//  PCWebViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestView: PCWebView {

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

}

final class PCWebViewTests: XCTestCase {

	func testInit() {
		let view = TestView()
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
	}

	func testInitWithFrame() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let pcView = PCWebView(frame: frame)
		XCTAssertEqual(pcView.frame, frame)

		let view = TestView(frame: frame)
		XCTAssertEqual(view.frame, frame)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcView = PCWebView(coder: coder)
		XCTAssertNotNil(pcView)

		let view = TestView(coder: coder)
		XCTAssertNotNil(view)
		XCTAssert(view!.didCallSetupViews)
		XCTAssert(view!.didCallSetupLayout)
		XCTAssertEqual(view!.backgroundColor, .white)
	}

}
