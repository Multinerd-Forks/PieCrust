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

    var didCallSetViews = false
    var didCallLayoutViews = false

    var preferredHeight: CGFloat {
        return 10.0
    }

    override func setViews() {
        super.setViews()
        didCallSetViews = true
    }

    override func layoutViews() {
        super.layoutViews()
        didCallLayoutViews = true
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

        let buttonWithCustomBackgroundColor = PCButton(backgroundColor: .red)
        XCTAssertEqual(buttonWithCustomBackgroundColor.backgroundColor, .red)

        let buttonWithCustomTintColor = PCButton(
                                    type: UIButtonType.system,
                                    title: "hello",
                                    titleFont: font,
                                    image: UIImage(named: "piecrust.png"),
                                    contentEdgeInsets: insets,
                                    isEnabled: true,
                                    backgroundColor: .red,
                                    tintColor: .red,
                                    alpha: 0.5 )

        XCTAssertEqual(buttonWithCustomTintColor.tintColor, .red)
    }

    func testSetViews() {
        let button = CustomButton()

        button.setViews()
        XCTAssert(button.didCallSetViews)

    }

    func testLayoutViews() {
        let button = CustomButton()

        button.layoutViews()
        XCTAssert(button.didCallLayoutViews)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let button = CustomButton(coder: coder)

        XCTAssert(button!.didCallSetViews)
        XCTAssert(button!.didCallLayoutViews)

    }
    
}
