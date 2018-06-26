//
//  PCTableViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCTableViewTests: XCTestCase {

	let tableView = PCTableView()

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

	func testInit() {
		let header = UIView()
		let footer = UIView()

		let view = PCTableView(style: .grouped, cells: [UITableViewCell.self], allowsSelection: true, allowsMultipleSelection: false, showsVerticalScrollIndicator: true,
							   separatorStyle: .singleLineEtched, separatorColor: .green, separatorInset: .zero, scrollIndicatorInsets: .zero, bounces: false,
							   tableHeaderView: header, tableFooterView: footer, backgroundColor: .yellow)

		XCTAssertEqual(view.style, .grouped)
		let cell = view.dequeueReusableCell(withClass: UITableViewCell.self)
		XCTAssertNotNil(cell)
		XCTAssert(view.allowsSelection)
		XCTAssertFalse(view.allowsMultipleSelection)
		XCTAssert(view.showsVerticalScrollIndicator)
		XCTAssertEqual(view.separatorStyle, .singleLineEtched)
		XCTAssertNotNil(view.separatorColor)
		XCTAssertEqual(view.separatorColor!, .green)
		XCTAssertEqual(view.separatorInset, .zero)
		XCTAssertEqual(view.scrollIndicatorInsets, .zero)
		XCTAssertFalse(view.bounces)

		XCTAssertNotNil(view.tableHeaderView)
		XCTAssertEqual(view.tableHeaderView!, header)

		XCTAssertNotNil(view.tableFooterView)
		XCTAssertEqual(view.tableFooterView!, footer)

		XCTAssertNotNil(view.backgroundColor)
		XCTAssertEqual(view.backgroundColor!, .yellow)
	}

}
