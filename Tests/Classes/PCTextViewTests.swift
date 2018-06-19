//
//  PCTextViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCTextViewTests: XCTestCase {

	func testConvenienceInit() {
		let helloWorld = "Hello World!"
		let textView = PCTextView(text: .plain(helloWorld))

		XCTAssertEqual(textView.text, helloWorld)

		XCTAssertEqual(textView.attributedText.string, helloWorld)
		XCTAssertEqual(textView.textColor, PCColor.black)
		XCTAssertTrue(textView.isEditable)
		XCTAssertFalse(textView.allowsEditingTextAttributes)
		XCTAssertEqual(textView.textAlignment, .natural)
		XCTAssertEqual(textView.textContainerInset, .zero)
		XCTAssertEqual(textView.backgroundColor, PCColor.white)
		XCTAssertEqual(textView.tintColor, UITextView().tintColor)
		XCTAssertEqual(textView.alpha, 1.0)

		let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

		let customTextView = PCTextView(
			text: .attributed(NSAttributedString(string: helloWorld)),
			font: UIFont.boldSystemFont(ofSize: 10),
			textColor: .red,
			isEditable: false,
			allowsEditingTextAttributes: true,
			textAlignment: .left,
			textContainerInset: insets,
			backgroundColor: .green,
			tintColor: .blue)

		XCTAssertEqual(customTextView.text, helloWorld)
		XCTAssertEqual(customTextView.attributedText.string, helloWorld)
		XCTAssertEqual(customTextView.font, UIFont.boldSystemFont(ofSize: 10))
		XCTAssertEqual(customTextView.textColor, .red)
		XCTAssertFalse(customTextView.isEditable)
		XCTAssertTrue(customTextView.allowsEditingTextAttributes)
		XCTAssertEqual(customTextView.textAlignment, .left)
		XCTAssertEqual(customTextView.textContainerInset, insets)
		XCTAssertEqual(customTextView.backgroundColor, .green)
		XCTAssertEqual(customTextView.tintColor, .blue)
	}

}
