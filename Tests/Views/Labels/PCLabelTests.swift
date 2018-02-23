//
//  PCLabelTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 2/16/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCLabelTests: XCTestCase {

	func testConvenienceInit() {
		let labelWithDefaultArgs = PCLabel(text: "hello world!")
		XCTAssertNotNil(labelWithDefaultArgs.text)
		XCTAssertEqual(labelWithDefaultArgs.text!, "hello world!")
		XCTAssertEqual(labelWithDefaultArgs.textAlignment, .natural)
		XCTAssertEqual(labelWithDefaultArgs.numberOfLines, 1)
		XCTAssertEqual(labelWithDefaultArgs.backgroundColor, PCColor.white)
		XCTAssertEqual(labelWithDefaultArgs.textColor, PCColor.black)
		XCTAssertEqual(labelWithDefaultArgs.font, UILabel().font)
		XCTAssertFalse(labelWithDefaultArgs.adjustsFontSizeToFitWidth)
		XCTAssertEqual(labelWithDefaultArgs.minimumScaleFactor, 0.0)
		XCTAssertEqual(labelWithDefaultArgs.lineBreakMode, .byTruncatingTail)
		XCTAssertEqual(labelWithDefaultArgs.alpha, 1.0)
		XCTAssert(labelWithDefaultArgs.isEnabled)

		let attributedString = NSAttributedString(string: "hello world!")
		let attributedLabelWithDefaultArgs = PCLabel(text: nil, attributedText: attributedString)
		XCTAssertEqual(attributedLabelWithDefaultArgs.attributedText!.string, attributedString.string)

		let font = PCFont.systemFont(ofSize: 50, weight: .bold)
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
