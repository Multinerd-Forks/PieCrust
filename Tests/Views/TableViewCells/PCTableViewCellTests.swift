//
//  PCTableViewCellTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCTableViewCell: PCTableViewCell {

    var didCallSetViews = false
    var didCallLayoutViews = false

    override func setViews() {
        super.setViews()

        didCallSetViews = true
    }

    override func layoutViews() {
        super.layoutViews()

        didCallLayoutViews = true
    }

}

class PCTableViewCellTests: XCTestCase {

    func testSetViews() {
        let cell = PCTableViewCell()
        
        XCTAssertEqual(cell.backgroundColor, PCColor.white)
        XCTAssertEqual(cell.selectionStyle, .none)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let customCell = CustomPCTableViewCell(coder: coder)

        XCTAssertEqual(customCell?.didCallSetViews, true)
        XCTAssertEqual(customCell?.didCallLayoutViews, true)
    }

}
