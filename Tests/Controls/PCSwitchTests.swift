//
//  PCSwitchTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCSwitchTests: XCTestCase {
    
    func testToggle() {
        let testSwitch = PCSwitch()

        testSwitch.setOn(false, animated: false)
        testSwitch.toggle()

        XCTAssert(testSwitch.isOn)
    }
    
}
