//
//  PCTextFieldTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestTextField: PCTextField {

	var preferredHeight: CGFloat {
		return 60
	}

}

final class PCTextFieldTests: XCTestCase {

	let placeholder = "Email Address"
	let helloWorld = "hello world!"
	let emailAddress = "john@appleseed.com"

	func testConvenienceInit() {
		let textField1 = PCTextField(placeholder: .plain(placeholder), text: nil, textAlignment: .center, textType: .emailAddress, textColor: .red, font: .systemFont(ofSize: 14, weight: .bold), borderStyle: .roundedRect, backgroundColor: .yellow, tintColor: .blue)

		XCTAssertNotNil(textField1.placeholder)
		XCTAssertEqual(textField1.placeholder!, placeholder)
		XCTAssertEqual(textField1.text, "")
		XCTAssertEqual(textField1.textAlignment, .center)
		XCTAssertEqual(textField1.textColor, .red)
		XCTAssertEqual(textField1.font, .systemFont(ofSize: 14, weight: .bold))
		XCTAssertEqual(textField1.borderStyle, .roundedRect)
		XCTAssertEqual(textField1.backgroundColor, .yellow)
		XCTAssertEqual(textField1.tintColor, .blue)

		let textField2 = PCTextField(placeholder: .attributed(NSAttributedString(string: placeholder)))
		XCTAssertNotNil(textField2.attributedPlaceholder)
		XCTAssertEqual(textField2.attributedPlaceholder!, NSAttributedString(string: placeholder))

		let textField3 = PCTextField(placeholder: .plain(placeholder), text: .plain(emailAddress))
		XCTAssertNotNil(textField3.text)
		XCTAssertEqual(textField3.text!, emailAddress)

		let textField4 = PCTextField(placeholder: .plain(placeholder), text: .attributed(NSAttributedString(string: placeholder)))
		XCTAssertNotNil(textField4.attributedText)
		XCTAssertEqual(textField4.attributedText!.string, placeholder)
	}

	func testTextType() {
		let textField = PCTextField()

		textField.setTextType(.emailAddress)
		XCTAssertFalse(textField.isSecureTextEntry)
		XCTAssertEqual(textField.keyboardType, .emailAddress)
		XCTAssertEqual(textField.autocorrectionType, .no)
		XCTAssertEqual(textField.autocapitalizationType, .none)

		textField.setTextType(.url)
		XCTAssertFalse(textField.isSecureTextEntry)
		XCTAssertEqual(textField.keyboardType, .URL)
		XCTAssertEqual(textField.autocorrectionType, .no)
		XCTAssertEqual(textField.autocapitalizationType, .none)

		textField.setTextType(.phoneNumber)
		XCTAssertFalse(textField.isSecureTextEntry)
		if #available(iOS 10.0, *) {
			XCTAssertEqual(textField.keyboardType, .asciiCapableNumberPad)
		} else {
			XCTAssertEqual(textField.keyboardType, .numberPad)
		}

		textField.setTextType(.decimal)
		XCTAssertFalse(textField.isSecureTextEntry)
		XCTAssertEqual(textField.keyboardType, .decimalPad)

		textField.setTextType(.password)
		XCTAssert(textField.isSecureTextEntry)
		XCTAssertEqual(textField.keyboardType, .asciiCapable)
		XCTAssertEqual(textField.autocorrectionType, .no)
		XCTAssertEqual(textField.autocapitalizationType, .none)

		textField.setTextType(.generic)
		XCTAssertFalse(textField.isSecureTextEntry)
		XCTAssertEqual(textField.keyboardType, .asciiCapable)
		XCTAssertEqual(textField.autocorrectionType, .default)
		XCTAssertEqual(textField.autocapitalizationType, .sentences)
	}

	func testEmailAddress() {
		let textField = PCTextField()
		XCTAssertNil(textField.emailAddress)

		textField.text = helloWorld
		XCTAssertNil(textField.emailAddress)

		textField.text = emailAddress
		XCTAssertNotNil(textField.emailAddress)
		XCTAssertEqual(textField.text!, emailAddress)
	}

	func testHasValidEmail() {
		let textField = PCTextField()
		XCTAssertFalse(textField.hasValidEmail)

		textField.text = helloWorld
		XCTAssertFalse(textField.hasValidEmail)

		textField.text = emailAddress
		XCTAssert(textField.hasValidEmail)
	}

	func testTrimmedText() {
		let textField = PCTextField()
		XCTAssertEqual(textField.trimmedText, "")

		textField.text = "  hello world! \n \n"
		XCTAssertEqual(textField.trimmedText, helloWorld)

		textField.text = nil
		textField.attributedText = nil
		XCTAssertEqual(textField.trimmedText, "")
	}

	func testPreferredHeight() {
		let pcTextField = PCTextField()
		XCTAssertEqual(pcTextField.preferredHeight, 45.0)

		let textField = TestTextField()
		XCTAssertEqual(textField.preferredHeight, 60)
	}

}
