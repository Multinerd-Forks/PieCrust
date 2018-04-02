//
//  PCTableViewControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestTableViewController: PCTableViewController {

    var didCallSetTabBarItem = false
    var didCallSetNavigationItem = false
    var didCallSetGestureRecognizers = false

    var keyboardWillShowNotification: Notification?
    var keyboardDidShowNotification: Notification?
    var keyboardWillChangeFrameNotification: Notification?
    var keyboardDidChangeFrameNotification: Notification?
    var keyboardWillHideNotification: Notification?
    var keyboardDidHideNotification: Notification?

    override func loadView() {
        view = PCScrollView()
    }

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

    override open func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardEvents()
    }

    override var shouldEndEditingOnTap: Bool {
        return true
    }

    override func keyboardWillShow(_ notification: Notification) {
        super.keyboardWillShow(notification)

        keyboardWillShowNotification = notification
    }

    override func keyboardDidShow(_ notification: Notification) {
        super.keyboardDidShow(notification)

        keyboardDidShowNotification = notification
    }

    override func keyboardWillChangeFrame(_ notification: Notification) {
        super.keyboardWillChangeFrame(notification)

        keyboardWillChangeFrameNotification = notification
    }

    override func keyboardDidChangeFrame(_ notification: Notification) {
        super.keyboardDidChangeFrame(notification)

        keyboardDidChangeFrameNotification = notification
    }

    override func keyboardWillHide(_ notification: Notification) {
        super.keyboardWillHide(notification)

        keyboardWillHideNotification = notification
    }

    override func keyboardDidHide(_ notification: Notification) {
        super.keyboardDidHide(notification)

        keyboardDidHideNotification = notification
    }

    deinit {
        unregisterFromKeyboardEvents()
    }

}

class PCTableViewControllerTests: XCTestCase {
    
    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let tableView = TestTableViewController(coder: coder)
        XCTAssert((tableView?.shouldEndEditingOnTap)!)
        XCTAssertTrue((tableView?.canBecomeFirstResponder)!)
        XCTAssertEqual(tableView?.didCallSetTabBarItem, true)
    }

    func testNibNameInit() {
        let tableView = TestTableViewController(nibName: nil, bundle: nil)
        XCTAssert(tableView.didCallSetTabBarItem)
    }

    func testSetTabBarItem() {
        let tableView = TestTableViewController(style: UITableViewStyle.grouped)

        tableView.setTabBarItem()
        XCTAssert(tableView.didCallSetTabBarItem)
    }

    func testSetGestureRecognizers() {
        let tableView = TestTableViewController(style: UITableViewStyle.grouped)

        tableView.setGestureRecognizers()
        XCTAssert(tableView.didCallSetGestureRecognizers)
    }

    func testSetNavigationItem() {
        let tableView = TestTableViewController(style: UITableViewStyle.grouped)

        tableView.setNavigationItem()
        XCTAssert(tableView.didCallSetNavigationItem)
    }

    func testKeyboardMethods() {
        let viewController = TestTableViewController()
        viewController.viewDidLoad()

        let keyboardWillShowNotification = Notification(name: .UIKeyboardWillShow, object: nil)

        XCTAssertNil(viewController.keyboardWillShowNotification)
        NotificationCenter.default.post(keyboardWillShowNotification)
        XCTAssertNotNil(viewController.keyboardWillShowNotification)
        XCTAssertEqual(viewController.keyboardWillShowNotification, keyboardWillShowNotification)

        let keyboardDidShowNotification = Notification(name: .UIKeyboardDidShow, object: nil)

        XCTAssertNil(viewController.keyboardDidShowNotification)
        NotificationCenter.default.post(keyboardDidShowNotification)
        XCTAssertNotNil(viewController.keyboardDidShowNotification)
        XCTAssertEqual(viewController.keyboardDidShowNotification, keyboardDidShowNotification)

        let keyboardWillChangeFrameNotification = Notification(name: .UIKeyboardWillChangeFrame, object: nil)

        XCTAssertNil(viewController.keyboardWillChangeFrameNotification)
        NotificationCenter.default.post(keyboardWillChangeFrameNotification)
        XCTAssertNotNil(viewController.keyboardWillChangeFrameNotification)
        XCTAssertEqual(viewController.keyboardWillChangeFrameNotification, keyboardWillChangeFrameNotification)

        let keyboardDidChangeFrameNotification = Notification(name: .UIKeyboardDidChangeFrame, object: nil)

        XCTAssertNil(viewController.keyboardDidChangeFrameNotification)
        NotificationCenter.default.post(keyboardDidChangeFrameNotification)
        XCTAssertNotNil(viewController.keyboardDidChangeFrameNotification)
        XCTAssertEqual(viewController.keyboardDidChangeFrameNotification, keyboardDidChangeFrameNotification)

        let keyboardWillHideNotification = Notification(name: .UIKeyboardWillHide, object: nil)

        XCTAssertNil(viewController.keyboardWillHideNotification)
        NotificationCenter.default.post(keyboardWillHideNotification)
        XCTAssertNotNil(viewController.keyboardWillHideNotification)
        XCTAssertEqual(viewController.keyboardWillHideNotification, keyboardWillHideNotification)

        let keyboardDidHideNotification = Notification(name: .UIKeyboardDidHide, object: nil)

        XCTAssertNil(viewController.keyboardDidHideNotification)
        NotificationCenter.default.post(keyboardDidHideNotification)
        XCTAssertNotNil(viewController.keyboardDidHideNotification)
        XCTAssertEqual(viewController.keyboardDidHideNotification, keyboardDidHideNotification)
    }
    
}
