//
//  PCGenericTableControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCGenericTableViewControllerTests: XCTestCase {

    func testConvenienceInit() {
        let array = [1, 2, 3, 4, 5]
        let genericTableView = PCGenericTableViewController<PCGenericTableViewCell<Int>, Int>(style: .grouped, items: [array])
        XCTAssertEqual(genericTableView.items.item(at: 0)?.item(at: 4), array[4])
    }

}
