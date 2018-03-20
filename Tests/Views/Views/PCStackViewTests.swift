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
        let stackView = PCStackView(arrangedSubviews: views, axis: .horizontal, alignment: .center, distribution: .equalSpacing, spacing: 0.5,
                                    tintColor: PCColor.blue, alpha: 0.5)

        XCTAssertEqual(stackView.arrangedSubviews, views)
        XCTAssertEqual(stackView.axis, .horizontal)
        XCTAssertEqual(stackView.alignment, .center)
        XCTAssertEqual(stackView.distribution, .equalSpacing)
        XCTAssertEqual(stackView.spacing, 0.5)
        XCTAssertEqual(stackView.tintColor, PCColor.blue)
        XCTAssertEqual(stackView.alpha, 0.5)
    }
    
}
