//
//  PCLoadingButtonTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCLoadingButton: PCLoadingButton {

    var didCallSetViews = false
    
    override func setViews() {
        super.setViews()
        didCallSetViews = true
    }

}

class PCLoadingButtonTests: XCTestCase {

    let helloWorld = "hello world!"
    
    func  testConvenienceInit() {
        let insets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        let font = PCFont.systemFont(ofSize: 50, weight: .bold)

        let button = PCLoadingButton(
            type: .system,
            title: helloWorld,
            titleFont: font,
            image: UIImage(named: "piecrust.png"),
            contentEdgeInsets: insets,
            isEnabled: true,
            backgroundColor: .red,
            tintColor: .red,
            activityIndicatorTintColor: .red,
            alpha: 0.5)

        XCTAssertEqual(button.buttonType, .system)
        XCTAssertEqual(button.currentTitle, helloWorld)
        XCTAssertEqual(button.tintColor, .red)
        XCTAssertEqual(button.contentEdgeInsets, insets)
        XCTAssert(button.isEnabled)
        XCTAssertEqual(button.activityIndicator.color, .red)
        XCTAssertEqual(button.alpha, 0.5)
        XCTAssertEqual(button.backgroundColor, .red)
    }

    func testIsLoading() {
        let button = CustomPCLoadingButton()
        XCTAssertFalse(button.isLoading)
        XCTAssertFalse(button.activityIndicator.isAnimating)
        XCTAssert(button.isEnabled)

        button.isLoading = true
        XCTAssert(button.isLoading)
        XCTAssert(button.activityIndicator.isAnimating)
        XCTAssertFalse(button.isEnabled)

        button.isLoading = false
        XCTAssertFalse(button.isLoading)
        XCTAssertFalse(button.activityIndicator.isAnimating)
        XCTAssert(button.isEnabled)
    }

}
