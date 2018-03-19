//
//  PCScrollViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCScrollViewTests: XCTestCase {

    func testSetView() {
        let pcScrollView = PCScrollView()
        XCTAssertEqual(pcScrollView.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let pcScrollViewWithCustomFrame = PCScrollView(frame: frame)
        XCTAssertEqual(pcScrollViewWithCustomFrame.frame, frame)
    }

}
