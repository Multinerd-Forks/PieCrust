//
//  PCScrollViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestViewController: PCViewController {

    override func loadView() {
        view = TestScrollView()
    }

    var pcScrollView: TestScrollView {
        return view as! TestScrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardEvents()
    }

    override func keyboardWillShow(_ notification: Notification) {
        pcScrollView.handleKeyboardWillShow(notification)
    }

    override func keyboardDidShow(_ notification: Notification) {
        pcScrollView.handleKeyboardDidShow(notification)
    }

    override func keyboardWillChangeFrame(_ notification: Notification) {
        pcScrollView.handleKeyboardWillChangeFrame(notification)
    }

    override func keyboardDidChangeFrame(_ notification: Notification) {
        pcScrollView.handleKeyboardDidChangeFrame(notification)
    }

    override func keyboardWillHide(_ notification: Notification) {
        pcScrollView.handleKeyboardWillHide(notification)
    }

    override func keyboardDidHide(_ notification: Notification) {
        pcScrollView.handleKeyboardDidHide(notification)
    }

    deinit {
        unregisterFromKeyboardEvents()
    }

}

private class TestScrollView: PCScrollView {

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

class PCScrollViewTests: XCTestCase {

    func testSetView() {
        let scrollView = PCScrollView()
        XCTAssertEqual(scrollView.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let pcScrollViewWithCustomFrame = PCScrollView(frame: frame)
        XCTAssertEqual(pcScrollViewWithCustomFrame.frame, frame)
    }

    func testConvenienceInit() {
        let scrollView = PCScrollView(alpha: 1.0)
        XCTAssertTrue(scrollView.isScrollEnabled)
        XCTAssertFalse(scrollView.isDirectionalLockEnabled)
        XCTAssertFalse(scrollView.isPagingEnabled)
        XCTAssertTrue(scrollView.scrollsToTop)
        XCTAssertTrue(scrollView.bounces)
        XCTAssertFalse(scrollView.alwaysBounceVertical)
        XCTAssertFalse(scrollView.alwaysBounceHorizontal)
        XCTAssertEqual(scrollView.minimumZoomScale, 1.0)
        XCTAssertEqual(scrollView.maximumZoomScale, 1.0)
        XCTAssertTrue(scrollView.bouncesZoom)
        XCTAssertEqual(scrollView.keyboardDismissMode, .none)
        XCTAssertEqual(scrollView.backgroundColor, PCColor.white)
        XCTAssertEqual(scrollView.tintColor, UIScrollView().tintColor)
        XCTAssertEqual(scrollView.alpha, 1.0)

        let customScrollView = PCScrollView(
            isScrollEnabled: false,
            isDirectionalLockEnabled: true,
            isPagingEnabled: true,
            scrollsToTop: false,
            bounces: false,
            alwaysBounceVertical: true,
            alwaysBounceHorizontal: true,
            minimumZoomScale: 2.0,
            maximumZoomScale: 2.0,
            bouncesZoom: false,
            keyboardDismissMode: .onDrag,
            backgroundColor: PCColor.green,
            tintColor: PCColor.blue,
            alpha: 0.5)

        XCTAssertFalse(customScrollView.isScrollEnabled)
        XCTAssertTrue(customScrollView.isDirectionalLockEnabled)
        XCTAssertTrue(customScrollView.isPagingEnabled)
        XCTAssertFalse(customScrollView.scrollsToTop)
        XCTAssertFalse(customScrollView.bounces)
        XCTAssertTrue(customScrollView.alwaysBounceVertical)
        XCTAssertTrue(customScrollView.alwaysBounceHorizontal)
        XCTAssertEqual(customScrollView.minimumZoomScale, 2.0)
        XCTAssertEqual(customScrollView.maximumZoomScale, 2.0)
        XCTAssertFalse(customScrollView.bouncesZoom)

    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let scrollView = PCScrollView(coder: coder)
        XCTAssertNotNil(scrollView)

        let customScrollView = TestScrollView(coder: coder)
        XCTAssertEqual(customScrollView?.didCallSetViews, true)
        XCTAssertEqual(customScrollView?.didCallLayoutViews, true)
    }

    func testKeyboardMethods() {
        let viewController = TestViewController()
        viewController.viewDidLoad()

        let keyboardWillShowNotification = Notification(name: .UIKeyboardWillShow, object: nil)

        XCTAssertNil(viewController.pcScrollView.keyboardWillShowNotification)
        NotificationCenter.default.post(keyboardWillShowNotification)
        XCTAssertNotNil(viewController.pcScrollView.keyboardWillShowNotification)
        XCTAssertEqual(viewController.pcScrollView.keyboardWillShowNotification, keyboardWillShowNotification)

        let keyboardDidShowNotification = Notification(name: .UIKeyboardDidShow, object: nil)

        XCTAssertNil(viewController.pcScrollView.keyboardDidShowNotification)
        NotificationCenter.default.post(keyboardDidShowNotification)
        XCTAssertNotNil(viewController.pcScrollView.keyboardDidShowNotification)
        XCTAssertEqual(viewController.pcScrollView.keyboardDidShowNotification, keyboardDidShowNotification)

        let keyboardWillChangeFrameNotification = Notification(name: .UIKeyboardWillChangeFrame, object: nil)

        XCTAssertNil(viewController.pcScrollView.keyboardWillChangeFrameNotification)
        NotificationCenter.default.post(keyboardWillChangeFrameNotification)
        XCTAssertNotNil(viewController.pcScrollView.keyboardWillChangeFrameNotification)
        XCTAssertEqual(viewController.pcScrollView.keyboardWillChangeFrameNotification, keyboardWillChangeFrameNotification)

        let keyboardDidChangeFrameNotification = Notification(name: .UIKeyboardDidChangeFrame, object: nil)

        XCTAssertNil(viewController.pcScrollView.keyboardDidChangeFrameNotification)
        NotificationCenter.default.post(keyboardDidChangeFrameNotification)
        XCTAssertNotNil(viewController.pcScrollView.keyboardDidChangeFrameNotification)
        XCTAssertEqual(viewController.pcScrollView.keyboardDidChangeFrameNotification, keyboardDidChangeFrameNotification)

        let keyboardWillHideNotification = Notification(name: .UIKeyboardWillHide, object: nil)

        XCTAssertNil(viewController.pcScrollView.keyboardWillHideNotification)
        NotificationCenter.default.post(keyboardWillHideNotification)
        XCTAssertNotNil(viewController.pcScrollView.keyboardWillHideNotification)
        XCTAssertEqual(viewController.pcScrollView.keyboardWillHideNotification, keyboardWillHideNotification)

        let keyboardDidHideNotification = Notification(name: .UIKeyboardDidHide, object: nil)

        XCTAssertNil(viewController.pcScrollView.keyboardDidHideNotification)
        NotificationCenter.default.post(keyboardDidHideNotification)
        XCTAssertNotNil(viewController.pcScrollView.keyboardDidHideNotification)
        XCTAssertEqual(viewController.pcScrollView.keyboardDidHideNotification, keyboardDidHideNotification)
    }
    
}
