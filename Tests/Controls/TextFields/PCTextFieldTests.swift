//
//  PCTextFieldTests.swift
//  PieCrust
//
//  Created by Omar Albeik on 19.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestTextField: PCTextField {

    var preferredHeight: CGFloat {
        return 10.0
    }

}

class PCTextFieldTests: XCTestCase {

    let helloWorld = "hello world!"
    let emailAddress = "john@appleseed.com"

    func testConvenienceInit() {
        let textFieldWithDefaultArgs = PCTextField(placeholder: helloWorld)
        XCTAssertNotNil(textFieldWithDefaultArgs.placeholder)
        XCTAssertEqual(textFieldWithDefaultArgs.placeholder!, helloWorld)
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

        let attributedString = NSAttributedString(string: helloWorld)
        let attributedTextFieldWithDefaultArgs = PCTextField(placeholder: "", attributedPlaceholder: attributedString, attributedText: attributedString)
        XCTAssertEqual(attributedTextFieldWithDefaultArgs.attributedPlaceholder!.string, attributedString.string)
        XCTAssertEqual(attributedTextFieldWithDefaultArgs.attributedText!.string, attributedString.string)

        let font = PCFont.systemFont(ofSize: 50, weight: .bold)
        let textFieldWithCustomFont = PCTextField(placeholder: helloWorld, font: font)
        XCTAssertEqual(textFieldWithCustomFont.font, font)

        let textFieldWithMinFontSize = PCTextField(placeholder: helloWorld, minimumFontSize: 10, tintColor: .red)
        XCTAssertEqual(textFieldWithMinFontSize.minimumFontSize, 10)
        XCTAssertEqual(textFieldWithMinFontSize.tintColor, .red)
    }

    func testsetPlaceHolderTextColor() {
        let pcTextField = PCTextField()

        pcTextField.setPlaceHolderTextColor(.red)
        XCTAssertNil(pcTextField.attributedPlaceholder)

        pcTextField.placeholder = helloWorld
        pcTextField.setPlaceHolderTextColor(.red)

        let holder = NSAttributedString(string: pcTextField.placeholder!, attributes: [.foregroundColor: PCColor.red])
        XCTAssertEqual(pcTextField.attributedPlaceholder, holder)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let textField = PCTextField(coder: coder)
        XCTAssertNotNil(textField)

        let customTextField = TestTextField(coder: coder)
        XCTAssertNotNil(customTextField)
    }

    func testPreferredHeight() {
        let textField = PCTextField()
        let height: CGFloat = UIScreen.main.isSmall ? 40.0 : 48.0
        XCTAssertEqual(textField.preferredHeight, height)

        let customTextField = TestTextField()
        XCTAssertEqual(customTextField.preferredHeight, 10.0)
    }

    func testIsEmpty() {
        let textField = PCTextField()
        XCTAssert(textField.isEmpty)

        textField.text = helloWorld
        XCTAssertFalse(textField.isEmpty)

        textField.text = nil
        XCTAssert(textField.isEmpty)
    }

    func testTrimmedText() {
        let textField = PCTextField()
        XCTAssertEqual(textField.trimmedText, "")

        textField.text = "  hello world! \n \n"
        XCTAssertEqual(textField.trimmedText, helloWorld)

        textField.text = nil
        XCTAssertEqual(textField.trimmedText, "")

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

    func testTextType() {
        let textField = PCTextField(placeholder: helloWorld)

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
