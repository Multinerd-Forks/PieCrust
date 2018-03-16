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
        let pcLoadingButton: PCLoadingButton = PCLoadingButton()
        XCTAssertEqual(pcLoadingButton.contentEdgeInsets, UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
        XCTAssertTrue(pcLoadingButton.isEnabled)
        XCTAssertNil(pcLoadingButton.currentTitle)
        XCTAssertNil(pcLoadingButton.backgroundColor)
        XCTAssertEqual(pcLoadingButton.alpha, 1.0)

        let testColor = UIColor.red
        let pcLoadingButtonWithColor: PCLoadingButton = PCLoadingButton(backgroundColor: testColor, tintColor: testColor, alpha: 0.3)
        XCTAssertEqual(pcLoadingButtonWithColor.backgroundColor, testColor)
        XCTAssertEqual(pcLoadingButtonWithColor.tintColor, testColor)



    }
    
}
