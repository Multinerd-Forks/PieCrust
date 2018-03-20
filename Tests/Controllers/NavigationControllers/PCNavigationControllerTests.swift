//
//  PCNavigationControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCNavigationControllerTests: XCTestCase {
    
    func testSetNavigationBarColors() {
        let navBar = PCNavigationController()
        navBar.setNavigaitonBarColors(background: PCColor.blue, tint: PCColor.green)

        XCTAssertEqual(navBar.navigationBar.backgroundColor, PCColor.blue)
        XCTAssertEqual(navBar.navigationBar.barTintColor, PCColor.blue)
        XCTAssertEqual(navBar.navigationBar.tintColor, PCColor.green)
    }

}
