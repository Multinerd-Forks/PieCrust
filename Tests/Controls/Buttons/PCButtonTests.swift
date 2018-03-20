//
//  PCButtonTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 15.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomButton: PCButton {

    var preferredHeight: CGFloat {
        return 10.0
    }

}

class PCButtonTests: XCTestCase {

    func testPreferredHeight() {
        let button = PCButton()
        let height: CGFloat = UIScreen.main.isSmall ? 40.0 : 48.0
        XCTAssertEqual(button.preferredHeight, height)

        let customButton = CustomButton()
        XCTAssertEqual(customButton.preferredHeight, 10.0)
    }

    func  testConvenienceInit() {
        let buttonWithDefaultArgs = PCButton(type: UIButtonType.system, title: "hello world")
        XCTAssertNotNil(buttonWithDefaultArgs.currentTitle)
        XCTAssertEqual(buttonWithDefaultArgs.currentTitle, "hello world")
        XCTAssertTrue(buttonWithDefaultArgs.isEnabled)
        XCTAssertEqual(buttonWithDefaultArgs.alpha, 1.0)
        XCTAssertEqual(buttonWithDefaultArgs.backgroundColor, PCColor.white)
        XCTAssertEqual(buttonWithDefaultArgs.tintColor, UIButton().tintColor)

        let insets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        XCTAssertEqual(buttonWithDefaultArgs.contentEdgeInsets, insets)

        let font = PCFont.systemFont(ofSize: 50, weight: .bold)
        let buttonWithCustomFont = PCButton(type: UIButtonType.custom, title: "hello world", titleFont: font)
        XCTAssertEqual(buttonWithCustomFont.titleLabel?.font, font)

        let color = UIColor.red
        let buttonWithCustomBackgroundColor = PCButton(backgroundColor: color)
        XCTAssertEqual(buttonWithCustomBackgroundColor.backgroundColor, color)

        let buttonWithCustomTintColor = PCButton(tintColor: color)
        XCTAssertEqual(buttonWithCustomTintColor.tintColor, color)
    }
    
}
