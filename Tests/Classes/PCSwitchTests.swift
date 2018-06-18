//
//  PCSwitchTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCSwitchTests: XCTestCase {

	func testToggle() {
		let testSwitch = PCSwitch()

		testSwitch.setOn(false, animated: false)
		testSwitch.toggle()

		XCTAssert(testSwitch.isOn)
	}

}
