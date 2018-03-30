//
//  PCGenericTableControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestTableViewCell: PCGenericTableViewCell<Int> {}

private class TestTableViewController: PCGenericTableViewController<TestTableViewCell, Int> {

    override var items: [[Int]] {
        didSet {
            tableView.reloadData()
        }
    }

}

class PCGenericTableViewControllerTests: XCTestCase {

    let items = [[1, 2, 3, 4, 5], [6, 7, 8, 9]]
    let indexPath = IndexPath(row: 0, section: 0)

    func testConvenienceInitializers() {
        let tableViewController = TestTableViewController(style: .plain, items: items)

        XCTAssertEqual(tableViewController.tableView.style, .plain)
        XCTAssertEqual(tableViewController.items.count, items.count)

        XCTAssertEqual(tableViewController.tableView.numberOfSections, 2)
        XCTAssertEqual(tableViewController.tableView.numberOfRows(inSection: 0), items[0].count)
        XCTAssertEqual(tableViewController.tableView.numberOfRows(inSection: 1), items[1].count)

        let cell = tableViewController.tableView.cellForRow(at: indexPath)
        XCTAssertNotNil(cell)

        tableViewController.tableView(tableViewController.tableView, didHighlightRowAt: indexPath)
        XCTAssert(cell!.isHighlighted)

        tableViewController.tableView(tableViewController.tableView, didUnhighlightRowAt: indexPath)
        XCTAssertFalse(cell!.isHighlighted)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let viewController = TestTableViewController(coder: coder)
        viewController?.items = items
        XCTAssertNotNil(viewController)

        let cell = viewController?.tableView.cellForRow(at: .init(row: 0, section: 0))
        XCTAssertNotNil(cell)
        XCTAssert(cell!.isKind(of: TestTableViewCell.self))
    }

    func testInitWithNib() {
        let viewController = TestTableViewController(nibName: nil, bundle: nil)
        viewController.items = items

        let cell = viewController.tableView.cellForRow(at: .init(row: 0, section: 0))
        XCTAssertNotNil(cell)
        XCTAssert(cell!.isKind(of: TestTableViewCell.self))
    }

}
