//
//  PCLoadingButtonTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCLoadingButtonTests: XCTestCase {
    
    func  testConvenienceInit() {
        let button: PCLoadingButton = PCLoadingButton()
        XCTAssertEqual(button.contentEdgeInsets, UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
        XCTAssertTrue(button.isEnabled)
        XCTAssertNil(button.currentTitle)
        XCTAssertNil(button.backgroundColor)
        XCTAssertEqual(button.alpha, 1.0)

        let testColor = UIColor.red
        let pcLoadingButtonWithColor: PCLoadingButton = PCLoadingButton(backgroundColor: testColor, tintColor: testColor, alpha: 0.3)
        XCTAssertEqual(pcLoadingButtonWithColor.backgroundColor, testColor)
        XCTAssertEqual(pcLoadingButtonWithColor.tintColor, testColor)
    }

    func testIsLoading() {
        let button = PCLoadingButton()
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
