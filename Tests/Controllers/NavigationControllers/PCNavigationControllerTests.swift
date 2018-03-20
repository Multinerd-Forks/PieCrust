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

        let naviBar = PCNavigationController()
        naviBar.setNavigaitonBarColors(background: PCColor.blue, tint: PCColor.green)

        XCTAssertEqual(naviBar.navigationBar.backgroundColor, PCColor.blue)
        XCTAssertEqual(naviBar.navigationBar.barTintColor, PCColor.blue)
        XCTAssertEqual(naviBar.navigationBar.tintColor, PCColor.green)

    }

}
