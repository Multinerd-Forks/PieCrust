//
//  PCAppVersionLabelTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 22.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomAppVersionLabel: PCAppVersionLabel {

    override var version: String? {
        guard let appVersion = Bundle(for: type(of: self )).infoDictionary?["CFBundleShortVersionString"] as? String else { return nil }
        return hasVPrefeix ? "v\(appVersion)" : appVersion
    }
}
class PCAppVersionLabelTests: XCTestCase {
    
    func testConvenienceInit() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let versionLabel = PCAppVersionLabel(frame: frame)
        
        versionLabel.hasVPrefeix = true

        XCTAssertEqual(versionLabel.frame, frame)
        XCTAssertNil(versionLabel.version)

    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let versionLabel = PCAppVersionLabel(coder: coder)
        XCTAssertNotNil(versionLabel)
    }

    func testVersion() {

        let versionLabelWithPrefix = CustomAppVersionLabel(hasVPrefeix: false)
        XCTAssertFalse(versionLabelWithPrefix.hasVPrefeix)

        let appVersion = Bundle(for: type(of: self )).infoDictionary?["CFBundleShortVersionString"] as! String
        XCTAssertEqual(versionLabelWithPrefix.version, appVersion)
        versionLabelWithPrefix.hasVPrefeix = true
        XCTAssertEqual(versionLabelWithPrefix.version, "v\(appVersion)")
    }
    
}
