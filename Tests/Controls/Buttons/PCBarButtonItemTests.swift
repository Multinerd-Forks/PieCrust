//
//  PCBarButtonItemTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCBarButtonItem: PCBarButtonItem {

    var didCallAction = false
    @objc
    func testFunc() {
        didCallAction = true
    }
}
class PCBarButtonItemTests: XCTestCase {

    func testConvenienceInit() {

        let button = CustomPCBarButtonItem(button: UIButton(), badgeText: "hello world", target: nil, action: #selector(CustomPCBarButtonItem.testFunc))

        XCTAssertEqual(button.badgeText, "hello world")
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

        button.badgeLabel.text = "hello world"
        XCTAssertEqual(button.badgeLabel.text, "hello world")

        XCTAssertEqual(button.badgeBackgroundColor, .red)
        XCTAssertEqual(button.badgeFontColor, .white)

        button.badgeBackgroundColor = .green
        XCTAssertEqual(button.badgeBackgroundColor, .green)
    }

    func testsBadgeText() {
        let button = PCBarButtonItem()
        XCTAssertNil(button.badgeLabel.text)

        button.badgeText = "hello world"
        XCTAssertFalse(button.badgeText!.isEmpty)
        
        XCTAssertEqual(button.badgeLabel.text, " hello world ")
        XCTAssertEqual(button.badgeLabel.isHidden, false)

        let frame = button.badgeButton?.frame
        XCTAssertEqual(button.badgeButton?.frame, frame)
    }

    func testBadgeFontSize() {
        let button = CustomPCBarButtonItem()

        XCTAssertEqual(button.badgeFontSize, UIFont.smallSystemFontSize)
        XCTAssertEqual(button.badgeLabel.font, .systemFont(ofSize: UIFont.smallSystemFontSize))
        XCTAssertEqual(button.badgeLabel.layer.cornerRadius, (UIFont.smallSystemFontSize * 0.6))
    }

    func testaddTargetForAction() {
        let button = CustomPCBarButtonItem()
        button.addTargetForAction(self, action: #selector(CustomPCBarButtonItem.testFunc))
        button.testFunc()
        XCTAssert(button.didCallAction)
    }

}
