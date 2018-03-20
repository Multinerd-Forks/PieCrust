//
//  PCActivityIndicatorViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCActivityIndicatorViewTests: XCTestCase {
    
    func testConvenienceInit() {
        let indicator = PCActivityIndicatorView()
        XCTAssertEqual(indicator.activityIndicatorViewStyle, UIActivityIndicatorViewStyle.white)
        XCTAssertTrue(indicator.hidesWhenStopped)
        XCTAssertEqual(indicator.color, UIActivityIndicatorView().color)
        XCTAssertEqual(indicator.alpha, 1.0)

        let customIndicator = PCActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge, hidesWhenStopped: false, color: PCColor.red, alpha: 0.5)
        XCTAssertEqual(customIndicator.activityIndicatorViewStyle, UIActivityIndicatorViewStyle.whiteLarge)
        XCTAssertFalse(customIndicator.hidesWhenStopped)
        XCTAssertEqual(customIndicator.color, PCColor.red)
        XCTAssertEqual(customIndicator.alpha, 0.5)
    }
    
}
