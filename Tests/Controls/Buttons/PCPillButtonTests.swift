//
//  PCPillButtonTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCPillButtonTests: XCTestCase {

    func testBounds() {
        let button = PCPillButton()
        XCTAssertEqual(button.cornerRadius, 0)

        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        XCTAssertEqual(button.cornerRadius, 25)
    }
    
}
