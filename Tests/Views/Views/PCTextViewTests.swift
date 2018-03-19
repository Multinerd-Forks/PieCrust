//
//  PCTextViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCTextViewTests: XCTestCase {

    func textConvenienceInit() {
        let textView = PCTextView()
        XCTAssertNil(textView.text)
        XCTAssertEqual(textView.attributedText, UITextView().attributedText)
        XCTAssertEqual(textView.font, UITextView().font)
        XCTAssertEqual(textView.textColor, PCColor.black)
        XCTAssertTrue(textView.isEditable)
        XCTAssertFalse(textView.allowsEditingTextAttributes)
        XCTAssertEqual(textView.textAlignment, .natural)
        XCTAssertEqual(textView.textContainerInset, UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        XCTAssertEqual(textView.backgroundColor, PCColor.white)
        XCTAssertEqual(textView.tintColor, UITextView().tintColor)
        XCTAssertEqual(textView.alpha, 1.0)

        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let attrString = NSAttributedString(string: "Hello.")

        let customTextView = PCTextView(text: "hello world", attributedText: attrString, font: UIFont.boldSystemFont(ofSize: 10), textColor: .red, isEditable: false, allowsEditingTextAttributes: true, textAlignment: .left, textContainerInset: insets, backgroundColor: .green, tintColor: .green, alpha: 0.5)

        XCTAssertEqual(customTextView.text, "hello world")
        XCTAssertEqual(customTextView.attributedText, attrString)
        XCTAssertEqual(customTextView.font, UIFont.boldSystemFont(ofSize: 10))
        XCTAssertEqual(customTextView.textColor, .red)
        XCTAssertFalse(customTextView.isEditable)
        XCTAssertTrue(customTextView.allowsEditingTextAttributes)
        XCTAssertEqual(customTextView.textAlignment, .left)
        XCTAssertEqual(customTextView.textContainerInset, insets)
        XCTAssertEqual(customTextView.backgroundColor, .green)
        XCTAssertEqual(customTextView.tintColor, .green)
        XCTAssertEqual(customTextView.alpha, 0.5)
    }

}
