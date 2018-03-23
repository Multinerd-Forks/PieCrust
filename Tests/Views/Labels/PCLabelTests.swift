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

    let helloWorld = "hello world!"

    func testConvenienceInit() {
        let labelWithDefaultArgs = PCLabel(text: helloWorld)
        XCTAssertNotNil(labelWithDefaultArgs.text)
        XCTAssertEqual(labelWithDefaultArgs.text!, helloWorld)
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

        let attributedString = NSAttributedString(string: helloWorld)
        let attributedLabelWithDefaultArgs = PCLabel(text: nil, attributedText: attributedString)
        XCTAssertEqual(attributedLabelWithDefaultArgs.attributedText!.string, attributedString.string)

        let font = PCFont.systemFont(ofSize: 50, weight: .bold)
        let labelWithCustomFont = PCLabel(text: helloWorld, font: font)
        XCTAssertEqual(labelWithCustomFont.font, font)

        let labelWithMinScale = PCLabel(text: helloWorld, minimumScaleFactor: 0.5)
        XCTAssert(labelWithMinScale.adjustsFontSizeToFitWidth)
        XCTAssertEqual(labelWithMinScale.minimumScaleFactor, 0.5)

        let labelWithWrongMinScale = PCLabel(text: helloWorld, minimumScaleFactor: 10.5, tintColor: PCColor.red)
        XCTAssertFalse(labelWithWrongMinScale.adjustsFontSizeToFitWidth)
        XCTAssertEqual(labelWithWrongMinScale.minimumScaleFactor, 0.0)
        XCTAssertEqual(labelWithWrongMinScale.tintColor, PCColor.red)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let label = PCLabel(coder: coder)
        XCTAssertNotNil(label)
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
