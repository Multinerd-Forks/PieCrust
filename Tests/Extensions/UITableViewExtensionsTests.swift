//
//  UITableViewExtensionsTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class UITableViewExtensionsTests: XCTestCase {

	let tableView = UITableView()

	func testRegisterReusableViewWithClass() {
		let nilTableHeaderView = tableView.dequeueReusableHeaderFooterView(withClass: UITableViewHeaderFooterView.self)
		XCTAssertNil(nilTableHeaderView)
		tableView.register(headerFooterViewClassWith: UITableViewHeaderFooterView.self)
		let tableHeaderView = tableView.dequeueReusableHeaderFooterView(withClass: UITableViewHeaderFooterView.self)
		XCTAssertNotNil(tableHeaderView)
	}

	func testRegisterCellWithClass() {
		let nilTableViewCell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
		XCTAssertNil(nilTableViewCell)
		tableView.register(cellWithClass: UITableViewCell.self)
		let tableViewCell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
		XCTAssertNotNil(tableViewCell)
	}

	func testDequeueReusableCellWithClass() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
		let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
		XCTAssertNotNil(cell)
	}

	func testDequeueReusableCellWithClassForIndexPath() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
		let indexPath = IndexPath(row: 0, section: 0)
		let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self, for: indexPath)
		XCTAssertNotNil(cell)
	}

	func testDequeueReusableHeaderFooterView() {
		tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "UITableViewHeaderFooterView")
		let headerFooterView = tableView.dequeueReusableHeaderFooterView(withClass: UITableViewHeaderFooterView.self)
		XCTAssertNotNil(headerFooterView)
	}

}
