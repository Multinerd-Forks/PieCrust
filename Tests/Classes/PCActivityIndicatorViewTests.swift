//
//  PCActivityIndicatorViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCActivityIndicatorViewTests: XCTestCase {

	func testConvenienceInit() {
		let indicatorView = PCActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge, hidesWhenStopped: false, color: .red)

		XCTAssertEqual(indicatorView.activityIndicatorViewStyle, UIActivityIndicatorViewStyle.whiteLarge)
		XCTAssertFalse(indicatorView.hidesWhenStopped)
		XCTAssertEqual(indicatorView.color, .red)
	}

}
