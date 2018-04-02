//
//  PCBarButtonItemTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestBarButtonItem: PCBarButtonItem {

    var didCallAction = false

    @objc
    func testFunc() {
        didCallAction = true
    }

}

class PCBarButtonItemTests: XCTestCase {

    let helloWorld = "hello world!"

    func testConvenienceInit() {
        let button = TestBarButtonItem(button: UIButton(), badgeText: helloWorld, target: nil, action: #selector(TestBarButtonItem.testFunc))

        XCTAssertEqual(button.badgeText, helloWorld)
        XCTAssertNil(button.target)
        button.testFunc()
        XCTAssert(button.didCallAction)
    }

    func testsFont() {
        let button = PCBarButtonItem()

        button.badgeFontColor = .green
        button.badgeFontSize = 20
        XCTAssertEqual(button.badgeFontColor, .green)
        XCTAssertEqual(button.badgeFontSize, 20)
        XCTAssertEqual(button.badgeLabel.layer.cornerRadius, 12)
    }

    func testColor() {
        let button = PCBarButtonItem()

        button.badgeLabel.text = helloWorld
        XCTAssertEqual(button.badgeLabel.text, helloWorld)

        XCTAssertEqual(button.badgeBackgroundColor, .red)
        XCTAssertEqual(button.badgeFontColor, .white)

        button.badgeBackgroundColor = .green
        XCTAssertEqual(button.badgeBackgroundColor, .green)
    }

    func testsBadgeText() {
        let button = PCBarButtonItem()
        XCTAssertNil(button.badgeLabel.text)

        button.badgeText = helloWorld
        XCTAssertFalse(button.badgeText!.isEmpty)
        
        XCTAssertEqual(button.badgeLabel.text, " \(helloWorld) ")
        XCTAssertEqual(button.badgeLabel.isHidden, false)

        let frame = button.badgeButton?.frame
        XCTAssertEqual(button.badgeButton?.frame, frame)
    }

    func testBadgeFontSize() {
        let button = TestBarButtonItem()

        XCTAssertEqual(button.badgeFontSize, UIFont.smallSystemFontSize)
        XCTAssertEqual(button.badgeLabel.font, .systemFont(ofSize: UIFont.smallSystemFontSize))
        XCTAssertEqual(button.badgeLabel.layer.cornerRadius, (UIFont.smallSystemFontSize * 0.6))
    }

    func testaddTargetForAction() {
        let button = TestBarButtonItem()

        button.addTargetForAction(self, action: #selector(TestBarButtonItem.testFunc))
        button.testFunc()
        XCTAssert(button.didCallAction)
    }

}
