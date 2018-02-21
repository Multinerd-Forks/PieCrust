//
//  PCTextFieldTests.swift
//  PieCrust
//
//  Created by Omar Albeik on 19.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomTextField: PCTextField {

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

	override var preferredHeight: CGFloat {
		return 10.0
	}

}

class PCTextFieldTests: XCTestCase {

    func testConvenienceInit() {
        let textFieldWithDefaultArgs = PCTextField(placeholder: "hello world")
        XCTAssertNotNil(textFieldWithDefaultArgs.placeholder)
        XCTAssertEqual(textFieldWithDefaultArgs.placeholder!, "hello world")
        XCTAssert(textFieldWithDefaultArgs.text!.isEmpty)
        XCTAssertEqual(textFieldWithDefaultArgs.textAlignment, .natural)
        XCTAssertEqual(textFieldWithDefaultArgs.textType, .generic)
        XCTAssertFalse(textFieldWithDefaultArgs.clearsOnBeginEditing)
        XCTAssertEqual(textFieldWithDefaultArgs.backgroundColor, PCColor.white)
        XCTAssertEqual(textFieldWithDefaultArgs.textColor, PCColor.black)
        XCTAssertEqual(textFieldWithDefaultArgs.font, UITextField().font)
        XCTAssertFalse(textFieldWithDefaultArgs.adjustsFontSizeToFitWidth)
        XCTAssertEqual(textFieldWithDefaultArgs.borderStyle, .none)
        XCTAssert(textFieldWithDefaultArgs.isEnabled)
        XCTAssertEqual(textFieldWithDefaultArgs.alpha, 1.0)

        let attributedString = NSAttributedString(string: "hello world!")
        let attributedTextFieldWithDefaultArgs = PCTextField(placeholder: "", attributedPlaceholder: attributedString, attributedText: attributedString)
        XCTAssertEqual(attributedTextFieldWithDefaultArgs.attributedPlaceholder!.string, attributedString.string)
        XCTAssertEqual(attributedTextFieldWithDefaultArgs.attributedText!.string, attributedString.string)

        let font = PCFont.systemFont(ofSize: 50, weight: .bold)
        let textFieldWithCustomFont = PCTextField(placeholder: "hello world!", font: font)
        XCTAssertEqual(textFieldWithCustomFont.font, font)

        let textFieldWithMinFontSize = PCTextField(placeholder: "hello world!", minimumFontSize: 10)
        XCTAssertEqual(textFieldWithMinFontSize.minimumFontSize, 10)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let textField = PCTextField(coder: coder)
        XCTAssertNotNil(textField)

        let customTextField = CustomTextField(coder: coder)
        XCTAssertNotNil(customTextField)

        XCTAssert(customTextField!.didCallSetView)
        XCTAssert(customTextField!.didCallLayoutViews)
    }

    func testSetViews() {
        let customTextField = CustomTextField()
        XCTAssert(customTextField.didCallSetView)
    }

    func testDidLayoutViews() {
        let customTextField = CustomTextField()
        XCTAssert(customTextField.didCallLayoutViews)
    }

    func testPreferredPadding() {
        let textField = PCTextField()
        XCTAssertEqual(textField.preferredPadding, 20.0)

        let customTextField = CustomTextField()
        XCTAssertEqual(customTextField.preferredPadding, 10.0)
    }

	func testPreferredHeight() {
		let textField = PCTextField()
		let height: CGFloat = UIScreen.main.isSmall ? 40.0 : 48.0
		XCTAssertEqual(textField.preferredHeight, height)

		let customTextField = CustomTextField()
		XCTAssertEqual(customTextField.preferredHeight, 10.0)
	}

    func testIsEmpty() {
        let textField = PCTextField()
        XCTAssert(textField.isEmpty)

        textField.text = "hello world!"
        XCTAssertFalse(textField.isEmpty)

        textField.text = nil
        XCTAssert(textField.isEmpty)
    }

    func testTrimmedText() {
        let textField = PCTextField()
        XCTAssertEqual(textField.trimmedText, "")

        textField.text = "  hello world! \n \n"
        XCTAssertEqual(textField.trimmedText, "hello world!")

        textField.text = nil
        XCTAssertEqual(textField.trimmedText, "")
    }

    func testEmailAddress() {
        let textField = PCTextField()
        XCTAssertNil(textField.emailAddress)

        textField.text = "hello world!"
        XCTAssertNil(textField.emailAddress)

        textField.text = "john@appleseed.com"
        XCTAssertNotNil(textField.emailAddress)
        XCTAssertEqual(textField.text!, "john@appleseed.com")
    }

    func testHasValidEmail() {
        let textField = PCTextField()
        XCTAssertFalse(textField.hasValidEmail)

        textField.text = "hello world!"
        XCTAssertFalse(textField.hasValidEmail)

        textField.text = "john@appleseed.com"
        XCTAssert(textField.hasValidEmail)
    }

    func testTextType() {
        let textField = PCTextField(placeholder: "hello world!")

        textField.textType = .emailAddress
        XCTAssertFalse(textField.isSecureTextEntry)
        XCTAssertEqual(textField.keyboardType, .emailAddress)
        XCTAssertEqual(textField.autocorrectionType, .no)
        XCTAssertEqual(textField.autocapitalizationType, .none)

        textField.textType = .url
        XCTAssertFalse(textField.isSecureTextEntry)
        XCTAssertEqual(textField.keyboardType, .URL)
        XCTAssertEqual(textField.autocorrectionType, .no)
        XCTAssertEqual(textField.autocapitalizationType, .none)

        textField.textType = .phoneNumber
        XCTAssertFalse(textField.isSecureTextEntry)
        if #available(iOS 10.0, *) {
            XCTAssertEqual(textField.keyboardType, .asciiCapableNumberPad)
        } else {
            XCTAssertEqual(textField.keyboardType, .numberPad)
        }

        textField.textType = .decimal
        XCTAssertFalse(textField.isSecureTextEntry)
        XCTAssertEqual(textField.keyboardType, .decimalPad)

        textField.textType = .password
        XCTAssert(textField.isSecureTextEntry)
        XCTAssertEqual(textField.keyboardType, .asciiCapable)
        XCTAssertEqual(textField.autocorrectionType, .no)
        XCTAssertEqual(textField.autocapitalizationType, .none)

        textField.textType = .generic
        XCTAssertFalse(textField.isSecureTextEntry)
        XCTAssertEqual(textField.keyboardType, .asciiCapable)
        XCTAssertEqual(textField.autocorrectionType, .default)
        XCTAssertEqual(textField.autocapitalizationType, .sentences)
    }

}
