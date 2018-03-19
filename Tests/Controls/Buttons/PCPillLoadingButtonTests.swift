//
//  PCPillLoadingButtonTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCPillLoadingButtonTests: XCTestCase {
    
    func testBounds() {
        let loadingButton = PCPillLoadingButton()
        XCTAssertEqual(loadingButton.cornerRadius, 0)

        loadingButton.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        XCTAssertEqual(loadingButton.cornerRadius, 25)
    }
}
