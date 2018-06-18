//
//  PCTableViewCellTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestCell: PCTableViewCell {

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

final class PCTableViewCellTests: XCTestCase {

	func testInit() {
		let cell = TestCell()
		XCTAssert(cell.didCallSetupViews)
		XCTAssert(cell.didCallSetupLayout)
		XCTAssertEqual(cell.backgroundColor, .white)
	}

	func testInitWithReuseIdentifier() {
		let reuseIdentifier = "Cell"

		let pcCell = PCTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
		XCTAssertNotNil(pcCell.reuseIdentifier)
		XCTAssertEqual(pcCell.reuseIdentifier!, reuseIdentifier)

		let cell = TestCell(style: .default, reuseIdentifier: reuseIdentifier)
		XCTAssert(cell.didCallSetupViews)
		XCTAssert(cell.didCallSetupLayout)
		XCTAssertEqual(cell.backgroundColor, .white)
		XCTAssertEqual(cell.preferredPadding, 10)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcCell = PCTableViewCell(coder: coder)
		XCTAssertNotNil(pcCell)
		XCTAssertEqual(pcCell!.preferredPadding, 20)

		let cell = TestCell(coder: coder)
		XCTAssertNotNil(cell)
		XCTAssert(cell!.didCallSetupViews)
		XCTAssert(cell!.didCallSetupLayout)
		XCTAssertEqual(cell!.backgroundColor, .white)
		XCTAssertEqual(cell!.preferredPadding, 10)
	}

}
