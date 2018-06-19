//
//  PCButtonTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestButton: PCButton {

	var preferredHeight: CGFloat {
		return 60.0
	}

}

final class PCButtonTests: XCTestCase {

	var title = "Login"

	func  testConvenienceInit() {
		let button1 = PCButton(type: .system, title: .plain(title), image: nil, titleFont: .systemFont(ofSize: 40, weight: .bold), contentEdgeInsets: .zero, isEnabled: false, backgroundColor: .red, tintColor: .yellow)

		XCTAssertEqual(button1.buttonType, .system)
		XCTAssertNotNil(button1.titleLabel?.text)
		XCTAssertEqual(button1.titleLabel!.text!, title)
		XCTAssertNil(button1.imageView?.image)
		XCTAssertEqual(button1.titleLabel!.font, .systemFont(ofSize: 40, weight: .bold))
		XCTAssertEqual(button1.contentEdgeInsets, .zero)
		XCTAssertFalse(button1.isEnabled)
		XCTAssertNotNil(button1.backgroundColor)
		XCTAssertEqual(button1.backgroundColor!, .red)
		XCTAssertEqual(button1.tintColor, .yellow)
		XCTAssertEqual(button1.preferredHeight, 45.0)

		let button2 = TestButton(type: .system, title: TextType.attributed(NSAttributedString(string: title)))
		XCTAssertNotNil(button2.titleLabel?.attributedText)
		XCTAssertEqual(button2.titleLabel!.attributedText!.string, title)
		XCTAssertEqual(button2.preferredHeight, 60.0)
	}

}
