//
//  PCPillTextFieldTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 15.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCPillTextFieldTests: XCTestCase {
    
    func testBounds() {
        let pillTextField = PCPillTextField()
        XCTAssertEqual(pillTextField.cornerRadius, 0)

        pillTextField.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        XCTAssertEqual(pillTextField.cornerRadius, 25)

    }

}
