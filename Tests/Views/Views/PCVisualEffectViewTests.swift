//
//  PCVisualEffectViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCVisualEffectViewTests: XCTestCase {

    func testConvenienceInit() {
        let effectView = PCVisualEffectView(effect: UIBlurEffect(style: .light), alpha: 0.5)
        XCTAssert(effectView.effect != nil)
        XCTAssertEqual(effectView.alpha, 0.5)

    }
}
