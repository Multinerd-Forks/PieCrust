//
//  PCBarButtonItemTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCBarButtonItemTests: XCTestCase {

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
    }

}
