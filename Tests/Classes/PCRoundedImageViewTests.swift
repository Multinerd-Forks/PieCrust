//
//  PCRoundedImageViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCRoundedImageViewTests: XCTestCase {

	func testBounds() {
		let view = PCRoundedImageView()
		XCTAssertEqual(view.cornerRadius, 0)

		view.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
		XCTAssertEqual(view.cornerRadius, 25)

		view.bounds = CGRect(x: 0, y: 0, width: 50, height: 100)
		XCTAssertEqual(view.cornerRadius, 25)

		view.bounds = CGRect(x: 0, y: 0, width: 60, height: 80)
		view.image = nil
		XCTAssertEqual(view.cornerRadius, 30)
	}

}
