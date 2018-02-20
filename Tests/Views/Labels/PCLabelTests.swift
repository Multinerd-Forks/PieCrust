//
//  PCLabelTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 2/16/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomLabel: PCLabel {

	var didCallSetView = false
	var didCallLayoutViews = false

	override func setViews() {
		super.setViews()

		didCallSetView = true
	}

	override func layoutViews() {
		super.layoutViews()

		didCallLayoutViews = true
	}

	override var preferredPadding: CGFloat {
		return 10.0
	}

}

class PCLabelTests: XCTestCase {

	func testConvenienceInit() {
		let labelWithDefaultArgs = PCLabel(text: "hello world!")
		XCTAssertNotNil(labelWithDefaultArgs.text)
		XCTAssertEqual(labelWithDefaultArgs.text!, "hello world!")
		XCTAssertEqual(labelWithDefaultArgs.textAlignment, .natural)
		XCTAssertEqual(labelWithDefaultArgs.numberOfLines, 1)
		XCTAssertEqual(labelWithDefaultArgs.backgroundColor, UIColor.white)
		XCTAssertEqual(labelWithDefaultArgs.textColor, UIColor.black)
		XCTAssertEqual(labelWithDefaultArgs.font, UILabel().font)
		XCTAssertFalse(labelWithDefaultArgs.adjustsFontSizeToFitWidth)
		XCTAssertEqual(labelWithDefaultArgs.minimumScaleFactor, 0.0)
		XCTAssertEqual(labelWithDefaultArgs.lineBreakMode, .byTruncatingTail)
        XCTAssertEqual(labelWithDefaultArgs.alpha, 1.0)
        XCTAssert(labelWithDefaultArgs.isEnabled)

		let attributedString = NSAttributedString(string: "hello world!")
		let attributedLabelWithDefaultArgs = PCLabel(text: nil, attributedText: attributedString)
		XCTAssertEqual(attributedLabelWithDefaultArgs.attributedText!.string, attributedString.string)

		let font = UIFont.systemFont(ofSize: 50, weight: .bold)
		let labelWithCustomFont = PCLabel(text: "hello world!", font: font)
		XCTAssertEqual(labelWithCustomFont.font, font)

		let labelWithMinScale = PCLabel(text: "hello world!", minimumScaleFactor: 0.5)
		XCTAssert(labelWithMinScale.adjustsFontSizeToFitWidth)
		XCTAssertEqual(labelWithMinScale.minimumScaleFactor, 0.5)

		let labelWithWrongMinScale = PCLabel(text: "hello world!", minimumScaleFactor: 10.5)
		XCTAssertFalse(labelWithWrongMinScale.adjustsFontSizeToFitWidth)
		XCTAssertEqual(labelWithWrongMinScale.minimumScaleFactor, 0.0)
	}

	func testInitWithCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let label = PCLabel(coder: coder)
		XCTAssertNotNil(label)

		let customLabel = CustomLabel(coder: coder)
		XCTAssertNotNil(label)

		XCTAssert(customLabel!.didCallSetView)
		XCTAssert(customLabel!.didCallLayoutViews)
	}

	func testSetViews() {
		let customLabel = CustomLabel()
		XCTAssert(customLabel.didCallSetView)
	}
	
	func testDidLayoutViews() {
		let customLabel = CustomLabel()
		XCTAssert(customLabel.didCallLayoutViews)
	}

	func testPreferredPadding() {
		let label = PCLabel()
		XCTAssertEqual(label.preferredPadding, 20.0)

		let customLabel = CustomLabel()
		XCTAssertEqual(customLabel.preferredPadding, 10.0)
	}

	func testIsEmpty() {
		let label = PCLabel()
		XCTAssert(label.isEmpty)

		label.text = "hello world!"
		XCTAssertFalse(label.isEmpty)

		label.text = nil
		XCTAssert(label.isEmpty)
	}

	func testTrimmedText() {
		let label = PCLabel()
		XCTAssertEqual(label.trimmedText, "")

		label.text = "  hello world! \n \n"
		XCTAssertEqual(label.trimmedText, "hello world!")

		label.text = nil
		XCTAssertEqual(label.trimmedText, "")
	}

}
