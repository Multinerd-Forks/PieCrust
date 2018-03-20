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

    var preferredHeight: CGFloat {
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

}
