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
		let nilTableHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PCTableViewHeaderFooterView.reuseIdentifier)
		XCTAssertNil(nilTableHeaderView)
		tableView.register(PCTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: PCTableViewHeaderFooterView.reuseIdentifier)
		let tableHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PCTableViewHeaderFooterView.reuseIdentifier)
		XCTAssertNotNil(tableHeaderView)
	}

	func testRegisterCellWithClass() {
		let nilTableViewCell = tableView.dequeueReusableCell(withIdentifier: PCTableViewCell.reuseIdentifier)
		XCTAssertNil(nilTableViewCell)
		tableView.register(PCTableViewCell.self, forCellReuseIdentifier: PCTableViewCell.reuseIdentifier)
		let tableViewCell = tableView.dequeueReusableCell(withIdentifier: PCTableViewCell.reuseIdentifier)
		XCTAssertNotNil(tableViewCell)
	}

	func testDequeueReusableCellWithClass() {
		tableView.register(PCTableViewCell.self, forCellReuseIdentifier: PCTableViewCell.reuseIdentifier)
		let cell = tableView.dequeueReusableCell(withIdentifier: PCTableViewCell.reuseIdentifier)
		XCTAssertNotNil(cell)
	}

	func testDequeueReusableCellWithClassForIndexPath() {
		tableView.register(PCTableViewCell.self, forCellReuseIdentifier: PCTableViewCell.reuseIdentifier)
		let indexPath = IndexPath(row: 0, section: 0)
		let cell = tableView.dequeueReusableCell(withIdentifier: PCTableViewCell.reuseIdentifier, for: indexPath)
		XCTAssertNotNil(cell)
	}

	func testDequeueReusableHeaderFooterView() {
		tableView.register(PCTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: PCTableViewHeaderFooterView.reuseIdentifier)
		let headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PCTableViewHeaderFooterView.reuseIdentifier)
		XCTAssertNotNil(headerFooterView)
	}

	func testInit() {
		let header = UIView()
		let footer = UIView()

		let view = PCTableView(style: .grouped, cells: [PCTableViewCell.self], allowsSelection: true, allowsMultipleSelection: false, showsVerticalScrollIndicator: true,
							   separatorStyle: .singleLineEtched, separatorColor: .green, separatorInset: .zero, scrollIndicatorInsets: .zero, bounces: false,
							   tableHeaderView: header, tableFooterView: footer, backgroundColor: .yellow)

		XCTAssertEqual(view.style, .grouped)
		let cell = view.dequeueReusableCell(withIdentifier: PCTableViewCell.reuseIdentifier)
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
