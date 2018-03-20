//
//  PCCollectionViewCellTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCCollectionViewCell: PCCollectionViewCell {

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
        let collectionViewCell = PCCollectionViewCell()
        XCTAssertEqual(collectionViewCell.backgroundColor, PCColor.white)

        let customCollecitonViewCell = CustomPCCollectionViewCell()
        XCTAssert(customCollecitonViewCell.didCallSetViews)
        XCTAssert(customCollecitonViewCell.didCallLayoutViews)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let pcCollectionViewCell = PCCollectionViewCell(coder: coder)
        XCTAssertNotNil(pcCollectionViewCell)

        let customCollectionViewCell = CustomPCCollectionViewCell(coder: coder)
        XCTAssertNotNil(customCollectionViewCell)
        XCTAssert(customCollectionViewCell!.didCallSetViews)
        XCTAssert(customCollectionViewCell!.didCallLayoutViews)
    }
    
}
