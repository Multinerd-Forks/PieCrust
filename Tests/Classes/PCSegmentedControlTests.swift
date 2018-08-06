//
//  PCSegmentedControlTests.swift
//  PieCrust
//
//  Created by Omar Albeik on 8/6/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCSegmentedControlTests: XCTestCase {

	func testInit() {
		let items = ["one", "two", "three"]

		let nFont = UIFont.systemFont(ofSize: 12, weight: .regular)
		let hFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
		let sFont = UIFont.systemFont(ofSize: 14, weight: .bold)

		let control = PCSegmentedControl(items: items, selectedSegmentIndex: 1, normalFont: nFont, highlightedFont: hFont, selectedFont: sFont, backgroundColor: .red, tintColor: .blue)

		for index in 0..<3 {
			let title = control.titleForSegment(at: index)
			XCTAssertNotNil(title)
			XCTAssertEqual(title!, items[index])
		}

		let nFontAttr = control.titleTextAttributes(for: .normal)?[NSAttributedStringKey.font] as? UIFont
		XCTAssertNotNil(nFontAttr)
		XCTAssertEqual(nFontAttr!, nFont)

		let hFontAttr = control.titleTextAttributes(for: .highlighted)?[NSAttributedStringKey.font] as? UIFont
		XCTAssertNotNil(hFontAttr)
		XCTAssertEqual(hFontAttr!, hFont)

		let sFontAttr = control.titleTextAttributes(for: .selected)?[NSAttributedStringKey.font] as? UIFont
		XCTAssertNotNil(sFontAttr)
		XCTAssertEqual(sFontAttr!, sFont)

		XCTAssertNotNil(control.backgroundColor)
		XCTAssertEqual(control.backgroundColor!, .red)
		XCTAssertEqual(control.tintColor, .blue)
	}

}
