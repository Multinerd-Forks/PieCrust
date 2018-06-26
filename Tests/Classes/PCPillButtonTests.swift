//
//  PCPillButtonTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCPillButtonTests: XCTestCase {

	func testBounds() {
		let button = PCPillButton()
		XCTAssertEqual(button.cornerRadius, 0)

		button.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
		XCTAssertEqual(button.cornerRadius, 25)

		button.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
		XCTAssertEqual(button.cornerRadius, 40)
	}

}
