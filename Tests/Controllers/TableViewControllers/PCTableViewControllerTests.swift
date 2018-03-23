//
//  PCTableViewControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCTableView: PCTableViewController {

    var didCallSetTabBarItem = false
    var didCallSetNavigationItem = false
    var didCallSetGestureRecognizers = false

    override func setTabBarItem() {
        super.setTabBarItem()
        didCallSetTabBarItem = true
    }

    override func setNavigationItem() {
        super.setNavigationItem()
        didCallSetNavigationItem = true
    }
    override func setGestureRecognizers() {
        super.setGestureRecognizers()
        didCallSetGestureRecognizers = true
    }

}

class PCTableViewControllerTests: XCTestCase {
    
    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let tableView = CustomPCTableView(coder: coder)
        XCTAssertFalse((tableView?.shouldEndEditingOnTap)!)
        XCTAssertTrue((tableView?.canBecomeFirstResponder)!)
        XCTAssertEqual(tableView?.didCallSetTabBarItem, true)
    }

    func testNibNameInit() {
        let tableView = CustomPCTableView(nibName: nil, bundle: nil)
        XCTAssert(tableView.didCallSetTabBarItem)
    }

    func testSetTabBarItem() {
        let tableView = CustomPCTableView(style: UITableViewStyle.grouped)

        tableView.setTabBarItem()
        XCTAssert(tableView.didCallSetTabBarItem)
    }

    func testSetGestureRecognizers() {
        let tableView = CustomPCTableView(style: UITableViewStyle.grouped)

        tableView.setGestureRecognizers()
        XCTAssert(tableView.didCallSetGestureRecognizers)
    }

    func testSetNavigationItem() {
        let tableView = CustomPCTableView(style: UITableViewStyle.grouped)

        tableView.setNavigationItem()
        XCTAssert(tableView.didCallSetNavigationItem)
    }
    
    
}
