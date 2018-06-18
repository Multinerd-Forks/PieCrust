//
//  PCCollectionViewCellTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestCell: PCCollectionViewCell {

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

final class PCCollectionViewCellTests: XCTestCase {

	func testInit() {
		let cell = TestCell()
		XCTAssert(cell.didCallSetupViews)
		XCTAssert(cell.didCallSetupLayout)
		XCTAssertEqual(cell.backgroundColor, .white)
		XCTAssertEqual(cell.preferredPadding, 10)
	}

	func testInitWithFrame() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let pcCell = PCCollectionViewCell(frame: frame)
		XCTAssertEqual(pcCell.frame, frame)

		let cell = TestCell(frame: frame)
		XCTAssertEqual(cell.frame, frame)
		XCTAssert(cell.didCallSetupViews)
		XCTAssert(cell.didCallSetupLayout)
		XCTAssertEqual(cell.backgroundColor, .white)
		XCTAssertEqual(cell.preferredPadding, 10)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcCell = PCCollectionViewCell(coder: coder)
		XCTAssertNotNil(pcCell)

		let cell = TestCell(coder: coder)
		XCTAssertNotNil(cell)
		XCTAssert(cell!.didCallSetupViews)
		XCTAssert(cell!.didCallSetupLayout)
		XCTAssertEqual(cell!.backgroundColor, .white)
		XCTAssertEqual(cell!.preferredPadding, 10)
	}

}
