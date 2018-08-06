//
//  PCTableViewHeaderFooterViewTests.swift
//  PieCrust
//
//  Created by Omar Albeik on 8/6/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestHeaderFooterView: PCTableViewHeaderFooterView {

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

final class PCTableViewHeaderFooterViewTests: XCTestCase {

	func testInit() {
		let view = TestHeaderFooterView()
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
	}

	func testInitWithReuseIdentifier() {
		let reuseIdentifier = "View"

		let pcHeaderFooterView = PCTableViewHeaderFooterView(reuseIdentifier: reuseIdentifier)
		XCTAssertNotNil(pcHeaderFooterView.reuseIdentifier)
		XCTAssertEqual(pcHeaderFooterView.reuseIdentifier!, reuseIdentifier)

		let view = TestHeaderFooterView(reuseIdentifier: reuseIdentifier)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcHeaderFooterView = PCTableViewHeaderFooterView(coder: coder)
		XCTAssertNotNil(pcHeaderFooterView)
		XCTAssertEqual(pcHeaderFooterView!.preferredPadding, 20)

		let view = TestHeaderFooterView(coder: coder)
		XCTAssertNotNil(view)
		XCTAssert(view!.didCallSetupViews)
		XCTAssert(view!.didCallSetupLayout)
		XCTAssertEqual(view!.preferredPadding, 10)
	}

}
