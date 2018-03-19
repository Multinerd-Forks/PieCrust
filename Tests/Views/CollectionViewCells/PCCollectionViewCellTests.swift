//
//  PCCollectionViewCellTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class CustomPCCollectionViewCell: PCCollectionViewCell {

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

class PCCollectionViewCellTests: XCTestCase {

    func testSetViews() {
        let pcCollectionViewCell = PCCollectionViewCell()
        XCTAssertEqual(pcCollectionViewCell.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        let pcCollectionViewCellWithCustomFrame  = PCCollectionViewCell(frame: frame)
        XCTAssertEqual(pcCollectionViewCellWithCustomFrame.frame, frame)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let pcCollectionViewCell = PCCollectionViewCell(coder: coder)
        XCTAssertNotNil(pcCollectionViewCell)

        let customPCCollectionViewCell = CustomPCCollectionViewCell(coder: coder)
        XCTAssertEqual(customPCCollectionViewCell?.didCallSetViews, true)
        XCTAssertEqual(customPCCollectionViewCell?.didCallLayoutViews, true)
    }
    
}
