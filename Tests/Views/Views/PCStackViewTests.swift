//
//  PCStackViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCStackViewTests: XCTestCase {
    
    func testConvenienceInit() {
        let views = [UIView(), UIView()]
        let customStack = PCStackView(arrangedSubviews: views, axis: .horizontal, alignment: .center, distribution: .equalSpacing, spacing: 0.5, tintColor: PCColor.blue, alpha: 0.5)

        XCTAssertEqual(customStack.arrangedSubviews, views)
        XCTAssertEqual(customStack.axis, .horizontal)
        XCTAssertEqual(customStack.alignment, .center)
        XCTAssertEqual(customStack.distribution, .equalSpacing)
        XCTAssertEqual(customStack.spacing, 0.5)
        XCTAssertEqual(customStack.backgroundColor, .white)
        XCTAssertEqual(customStack.tintColor, PCColor.blue)
        XCTAssertEqual(customStack.alpha, 0.5)
    }
    
}
