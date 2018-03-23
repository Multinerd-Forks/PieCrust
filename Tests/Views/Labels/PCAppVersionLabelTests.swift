//
//  PCAppVersionLabelTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 22.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCAppVersionLabelTests: XCTestCase {
    
    func testConvenienceInit() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let versionLabel = PCAppVersionLabel(frame: frame)
        
        versionLabel.hasVPrefeix = true

        XCTAssertEqual(versionLabel.frame, frame)
        XCTAssertNil(versionLabel.version)

        let versionLabelWithPrefix = PCAppVersionLabel(hasVPrefeix: false)
        XCTAssertFalse(versionLabelWithPrefix.hasVPrefeix)

    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let versionLabel = PCAppVersionLabel(coder: coder)
        XCTAssertNotNil(versionLabel)
    }
    
}
