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
        let indicatorView = PCActivityIndicatorView()
        XCTAssertEqual(indicatorView.activityIndicatorViewStyle, UIActivityIndicatorViewStyle.white)
        XCTAssertTrue(indicatorView.hidesWhenStopped)
        XCTAssertEqual(indicatorView.color, UIActivityIndicatorView().color)
        XCTAssertEqual(indicatorView.alpha, 1.0)

        let customIndicatorView = PCActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge, hidesWhenStopped: false,
                                                          color: PCColor.red, alpha: 0.5)
        
        XCTAssertEqual(customIndicatorView.activityIndicatorViewStyle, UIActivityIndicatorViewStyle.whiteLarge)
        XCTAssertFalse(customIndicatorView.hidesWhenStopped)
        XCTAssertEqual(customIndicatorView.color, PCColor.red)
        XCTAssertEqual(customIndicatorView.alpha, 0.5)
    }
    
}
