//
//  PCGenericTableViewCellTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCGenericTableViewCellTests: XCTestCase {

    func testGenericItem() {
        let cell = PCGenericTableViewCell<[Int]>()
        let items = [0, 1, 2, 3]
        cell.item = items
        XCTAssertEqual(cell.item, items)
    }
    
}
