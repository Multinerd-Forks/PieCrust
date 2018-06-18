//
//  PCLabelTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCLabelTests: XCTestCase {

	let helloWorld = "hello world!"

	func testConvenienceInit() {
		let label1 = PCLabel(text: .plain(string: helloWorld), textAlignment: .right, numberOfLines: 10, textColor: .red, font: .systemFont(ofSize: 40), minimumScaleFactor: 0.75, lineBreakMode: .byClipping, backgroundColor: .green, tintColor: .yellow)

		XCTAssertNotNil(label1.text)
		XCTAssertEqual(label1.text!, helloWorld)
		XCTAssertEqual(label1.textAlignment, .right)
		XCTAssertEqual(label1.numberOfLines, 10)
		XCTAssertEqual(label1.textColor, .red)
		XCTAssertEqual(label1.font, .systemFont(ofSize: 40))
		XCTAssert(label1.adjustsFontSizeToFitWidth)
		XCTAssertEqual(label1.minimumScaleFactor, 0.75)
		XCTAssertEqual(label1.lineBreakMode, .byClipping)
		XCTAssertNotNil(label1.backgroundColor)
		XCTAssertEqual(label1.backgroundColor!, .green)
		XCTAssertEqual(label1.tintColor, .yellow)

		let label2 = PCLabel(text: .attributed(string: NSAttributedString(string: helloWorld)))
		XCTAssertNotNil(label2.attributedText)
		XCTAssertEqual(label2.attributedText!.string, helloWorld)
	}

	func testIsEmpty() {
		let label = PCLabel()
		XCTAssert(label.isEmpty)

		label.text = helloWorld
		XCTAssertFalse(label.isEmpty)

		label.text = nil
		XCTAssert(label.isEmpty)
	}

	func testTrimmedText() {
		let label = PCLabel()
		XCTAssertEqual(label.trimmedText, "")

		label.text = "  hello world! \n \n"
		XCTAssertEqual(label.trimmedText, helloWorld)

		label.text = nil
		XCTAssertEqual(label.trimmedText, "")
	}

}
