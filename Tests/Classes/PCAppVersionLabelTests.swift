//
//  PCAppVersionLabelTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestLabel: PCAppVersionLabel {

	override var version: String? {
		guard let appVersion = Bundle(for: type(of: self)).infoDictionary?["CFBundleShortVersionString"] as? String else { return nil }
		return hasVPrefeix ? "v\(appVersion)" : appVersion
	}

}

final class PCAppVersionLabelTests: XCTestCase {

	func testConvenienceInit() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let versionLabel = PCAppVersionLabel(frame: frame)

		versionLabel.hasVPrefeix = true

		XCTAssertEqual(versionLabel.frame, frame)
		XCTAssertNil(versionLabel.version)

	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let label = PCAppVersionLabel(coder: coder)
		XCTAssertNotNil(label)
	}

	func testVersion() {
		let appVersion = Bundle(for: type(of: self )).infoDictionary?["CFBundleShortVersionString"] as! String

		let label1 = TestLabel(hasVPrefeix: false)
		XCTAssertFalse(label1.hasVPrefeix)
		XCTAssertEqual(label1.version, appVersion)

		let label2 = TestLabel(hasVPrefeix: true)
		XCTAssert(label2.hasVPrefeix)
		XCTAssertEqual(label2.version, "v\(appVersion)")
	}

}
