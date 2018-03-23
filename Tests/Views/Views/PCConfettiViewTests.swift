//
//  PCConfettiViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 22.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCConfettiViewTests: XCTestCase {

    func testBounds() {
        let confettiView = PCConfettiView()

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        confettiView.bounds = frame
        XCTAssertEqual(confettiView.bounds, frame)
    }

    func testIsActive() {
        let confettView = PCConfettiView()
        confettView.isActive = true

        XCTAssertEqual(confettView.intensity, 0.5)
        XCTAssertEqual(confettView.alpha, 1.0)
    }
    
}
