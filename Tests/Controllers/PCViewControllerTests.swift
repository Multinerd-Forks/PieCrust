//
//  PCViewControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestViewController: PCViewController {

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
        view = PCView()
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

private enum TestError: LocalizedError {
    case someError

    var errorDescription: String? {
        return "this is some error"
    }
    
    var localizedDescription: String {
        return "this is some error"
    }

}

class PCViewControllerTests: XCTestCase {

    let alertTitle = "Alert"
    let alertMessage = "Hey there, I'm an alert :)"
    let alertOption = "Got it!"

    func testConvenienceInit() {
        let viewController = TestViewController()

        XCTAssert(viewController.shouldEndEditingOnTap)
    }

    func testSetTabBarItem() {
        let viewController = TestViewController()

        XCTAssert(viewController.didCallSetTabBarItem)
    }

    func testSetNavigationItem() {
        let viewController = TestViewController()

        XCTAssertFalse(viewController.didCallSetNavigationItem)
        viewController.viewWillAppear(false)
        XCTAssert(viewController.didCallSetNavigationItem)
    }

    func testSetGestureRecognizers() {
        let viewController = TestViewController()

        XCTAssertFalse(viewController.didCallSetGestureRecognizers)
        viewController.viewDidLoad()
        XCTAssert(viewController.didCallSetGestureRecognizers)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let viewController = TestViewController(coder: coder)

        XCTAssertNotNil(viewController)
    }

    func testSetNavigationItemLogo() {
        let viewController = TestViewController()
        let bundle = Bundle.init(for: PCSegmentedControlTests.self)
        let image = UIImage(named: "piecrust.png", in: bundle, compatibleWith: nil)!
        let logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 30.0))

        logoView.contentMode = .scaleAspectFit
        logoView.image = image
        viewController.setNavigationItemLogo(image)

        XCTAssertEqual(viewController.navigationItem.titleView?.frame, logoView.frame)
        XCTAssertEqual(viewController.navigationItem.titleView?.isOpaque, logoView.isOpaque)
    }

    func testPcTabBarController() {
        let viewController = PCViewController()

        let tabBarController = viewController.pcTabBarController
        XCTAssertEqual(viewController.pcTabBarController, tabBarController)
    }

    func testPcView() {
        let viewController = TestViewController()
        XCTAssert(viewController.pcView.isKind(of: PCView.self))
    }

    func testPcNavigationController() {
        let viewController = PCViewController()

        let navController = viewController.pcNavigationController
        XCTAssertEqual(viewController.pcNavigationController, navController)
    }

    func testAlertInit() {
        let viewController = PCViewController()

        let alert = viewController.presentAlert(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet, tintColor: .red)
        XCTAssertNotNil(alert.title)
        XCTAssertEqual(alert.title!, alertTitle)

        XCTAssertNotNil(alert.message)
        XCTAssertEqual(alert.message!, alertMessage)

        XCTAssertEqual(alert.preferredStyle, .actionSheet)
        XCTAssertEqual(alert.view.tintColor, UIColor.red)

    }

    func testAlertInitWithCompletion() {
        let viewController = PCViewController()
        let alertAction = UIAlertAction(title: alertOption, style: .cancel)

        let alert = viewController.presentAlert(
            title: alertTitle,
            error: TestError.someError,
            preferredStyle: .actionSheet,
            tintColor: .red,
            actions: [alertAction])

        XCTAssertNotNil(alert.title)
        XCTAssertEqual(alert.title!, alertTitle)

        XCTAssertNotNil(alert.message!)
        XCTAssertEqual(alert.message!, TestError.someError.localizedDescription)

        XCTAssertEqual(alert.preferredStyle, .actionSheet)
        XCTAssertEqual(alert.view.tintColor, UIColor.red)
        XCTAssertEqual(alert.actions, [alertAction])
    }

    func testKeyboardMethods() {
        let viewController = TestViewController()
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
