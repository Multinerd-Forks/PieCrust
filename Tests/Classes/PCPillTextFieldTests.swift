//
//  PCPillTextFieldTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCPillTextFieldTests: XCTestCase {

	func testBounds() {
		let textField = PCPillTextField()
		XCTAssertEqual(textField.cornerRadius, 0)

		textField.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
		XCTAssertEqual(textField.cornerRadius, 25)

		textField.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
		XCTAssertEqual(textField.cornerRadius, 40)
	}

}
