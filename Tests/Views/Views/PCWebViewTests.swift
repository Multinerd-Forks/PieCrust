//
//  PCWebViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestViewController: PCViewController {

    override func loadView() {
        view = TestWebView()
    }

    var pcWebView: TestWebView {
        return view as! TestWebView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardEvents()
    }

    override func keyboardWillShow(_ notification: Notification) {
        pcWebView.handleKeyboardWillShow(notification)
    }

    override func keyboardDidShow(_ notification: Notification) {
        pcWebView.handleKeyboardDidShow(notification)
    }

    override func keyboardWillChangeFrame(_ notification: Notification) {
        pcWebView.handleKeyboardWillChangeFrame(notification)
    }

    override func keyboardDidChangeFrame(_ notification: Notification) {
        pcWebView.handleKeyboardDidChangeFrame(notification)
    }

    override func keyboardWillHide(_ notification: Notification) {
        pcWebView.handleKeyboardWillHide(notification)
    }

    override func keyboardDidHide(_ notification: Notification) {
        pcWebView.handleKeyboardDidHide(notification)
    }

    deinit {
        unregisterFromKeyboardEvents()
    }

}

private class TestWebView: PCWebView {

    var didCallSetViews = false
    var didCallLayoutViews = false

    var keyboardWillShowNotification: Notification?
    var keyboardDidShowNotification: Notification?
    var keyboardWillChangeFrameNotification: Notification?
    var keyboardDidChangeFrameNotification: Notification?
    var keyboardWillHideNotification: Notification?
    var keyboardDidHideNotification: Notification?

    override func setViews() {
        super.setViews()

        didCallSetViews = true
    }

    override func layoutViews() {
        super.layoutViews()

        didCallLayoutViews = true
    }

    override func handleKeyboardWillShow(_ notification: Notification) {
        super.handleKeyboardWillShow(notification)

        keyboardWillShowNotification = notification
    }

    override func handleKeyboardDidShow(_ notification: Notification) {
        super.handleKeyboardDidShow(notification)

        keyboardDidShowNotification = notification
    }

    override func handleKeyboardWillChangeFrame(_ notification: Notification) {
        super.handleKeyboardWillChangeFrame(notification)

        keyboardWillChangeFrameNotification = notification
    }

    override func handleKeyboardDidChangeFrame(_ notification: Notification) {
        super.handleKeyboardDidChangeFrame(notification)

        keyboardDidChangeFrameNotification = notification
    }

    override func handleKeyboardWillHide(_ notification: Notification) {
        super.handleKeyboardWillHide(notification)

        keyboardWillHideNotification = notification
    }

    override func handleKeyboardDidHide(_ notification: Notification) {
        super.handleKeyboardDidHide(notification)

        keyboardDidHideNotification = notification
    }

}

class PCWebViewTests: XCTestCase {

    func testConvenienceInit() {
        let webView = PCWebView()
        XCTAssertEqual(webView.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let pcWebViewWithCustomFrame = PCWebView(frame: frame)
        XCTAssertEqual(pcWebViewWithCustomFrame.frame, frame)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let webView = PCWebView(coder: coder)
        XCTAssertNotNil(webView)

        let customWebView = TestWebView(coder: coder)
        XCTAssertEqual(customWebView?.didCallSetViews, true)
        XCTAssertEqual(customWebView?.didCallLayoutViews, true)
    }

    func testKeyboardMethods() {
        let viewController = TestViewController()
        viewController.viewDidLoad()

        let keyboardWillShowNotification = Notification(name: .UIKeyboardWillShow, object: nil)

        XCTAssertNil(viewController.pcWebView.keyboardWillShowNotification)
        NotificationCenter.default.post(keyboardWillShowNotification)
        XCTAssertNotNil(viewController.pcWebView.keyboardWillShowNotification)
        XCTAssertEqual(viewController.pcWebView.keyboardWillShowNotification, keyboardWillShowNotification)

        let keyboardDidShowNotification = Notification(name: .UIKeyboardDidShow, object: nil)

        XCTAssertNil(viewController.pcWebView.keyboardDidShowNotification)
        NotificationCenter.default.post(keyboardDidShowNotification)
        XCTAssertNotNil(viewController.pcWebView.keyboardDidShowNotification)
        XCTAssertEqual(viewController.pcWebView.keyboardDidShowNotification, keyboardDidShowNotification)

        let keyboardWillChangeFrameNotification = Notification(name: .UIKeyboardWillChangeFrame, object: nil)

        XCTAssertNil(viewController.pcWebView.keyboardWillChangeFrameNotification)
        NotificationCenter.default.post(keyboardWillChangeFrameNotification)
        XCTAssertNotNil(viewController.pcWebView.keyboardWillChangeFrameNotification)
        XCTAssertEqual(viewController.pcWebView.keyboardWillChangeFrameNotification, keyboardWillChangeFrameNotification)

        let keyboardDidChangeFrameNotification = Notification(name: .UIKeyboardDidChangeFrame, object: nil)

        XCTAssertNil(viewController.pcWebView.keyboardDidChangeFrameNotification)
        NotificationCenter.default.post(keyboardDidChangeFrameNotification)
        XCTAssertNotNil(viewController.pcWebView.keyboardDidChangeFrameNotification)
        XCTAssertEqual(viewController.pcWebView.keyboardDidChangeFrameNotification, keyboardDidChangeFrameNotification)

        let keyboardWillHideNotification = Notification(name: .UIKeyboardWillHide, object: nil)

        XCTAssertNil(viewController.pcWebView.keyboardWillHideNotification)
        NotificationCenter.default.post(keyboardWillHideNotification)
        XCTAssertNotNil(viewController.pcWebView.keyboardWillHideNotification)
        XCTAssertEqual(viewController.pcWebView.keyboardWillHideNotification, keyboardWillHideNotification)

        let keyboardDidHideNotification = Notification(name: .UIKeyboardDidHide, object: nil)

        XCTAssertNil(viewController.pcWebView.keyboardDidHideNotification)
        NotificationCenter.default.post(keyboardDidHideNotification)
        XCTAssertNotNil(viewController.pcWebView.keyboardDidHideNotification)
        XCTAssertEqual(viewController.pcWebView.keyboardDidHideNotification, keyboardDidHideNotification)
    }
    
}
