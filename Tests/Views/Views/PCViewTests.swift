//
//  PCViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestViewController: PCViewController {

    override func loadView() {
        view = TestView()
    }

    var pcView: TestView {
        return view as! TestView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardEvents()
    }

    override func keyboardWillShow(_ notification: Notification) {
        pcView.handleKeyboardWillShow(notification)
    }

    override func keyboardDidShow(_ notification: Notification) {
        pcView.handleKeyboardDidShow(notification)
    }

    override func keyboardWillChangeFrame(_ notification: Notification) {
        pcView.handleKeyboardWillChangeFrame(notification)
    }

    override func keyboardDidChangeFrame(_ notification: Notification) {
        pcView.handleKeyboardDidChangeFrame(notification)
    }

    override func keyboardWillHide(_ notification: Notification) {
        pcView.handleKeyboardWillHide(notification)
    }

    override func keyboardDidHide(_ notification: Notification) {
        pcView.handleKeyboardDidHide(notification)
    }

    deinit {
        unregisterFromKeyboardEvents()
    }

}

private class TestView: PCView {

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

class PCViewTests: XCTestCase {
    
    func testConvenienceInit() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let view = PCView(frame: frame)

        XCTAssertEqual(view.frame, frame)
        XCTAssertEqual(view.backgroundColor, .white)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let view = PCView(coder: coder)
        XCTAssertNotNil(view)

        let customView = TestView(coder: coder)
        XCTAssertNotNil(customView)

        XCTAssertEqual(customView!.didCallSetViews, true)
        XCTAssertEqual(customView!.didCallLayoutViews, true)
    }

    func testShadow() {
        let view = PCView()
        XCTAssertEqual(view.borderWidth, view.layer.borderWidth)
        view.borderWidth = 1.0
    }

    func testBorder() {
        let view = PCView()
        let color = UIColor(cgColor: view.layer.borderColor!)
        XCTAssertEqual(view.borderColor, color)
        view.borderColor = .red

        view.setBorder(width: 1.0, color: .green, radius: 3.0)
        XCTAssertEqual(view.borderWidth, 1.0)
        XCTAssertEqual(view.borderColor, .green)
        XCTAssertEqual(view.cornerRadius, 3.0)
    }

    func testCornerRadius() {
        let view = PCView()

        XCTAssertEqual(view.cornerRadius, view.layer.cornerRadius)
        view.cornerRadius = 1.0
    }

    func testKeyboardMethods() {
        let viewController = TestViewController()
        viewController.viewDidLoad()

        let keyboardWillShowNotification = Notification(name: .UIKeyboardWillShow, object: nil)

        XCTAssertNil(viewController.pcView.keyboardWillShowNotification)
        NotificationCenter.default.post(keyboardWillShowNotification)
        XCTAssertNotNil(viewController.pcView.keyboardWillShowNotification)
        XCTAssertEqual(viewController.pcView.keyboardWillShowNotification, keyboardWillShowNotification)

        let keyboardDidShowNotification = Notification(name: .UIKeyboardDidShow, object: nil)

        XCTAssertNil(viewController.pcView.keyboardDidShowNotification)
        NotificationCenter.default.post(keyboardDidShowNotification)
        XCTAssertNotNil(viewController.pcView.keyboardDidShowNotification)
        XCTAssertEqual(viewController.pcView.keyboardDidShowNotification, keyboardDidShowNotification)

        let keyboardWillChangeFrameNotification = Notification(name: .UIKeyboardWillChangeFrame, object: nil)

        XCTAssertNil(viewController.pcView.keyboardWillChangeFrameNotification)
        NotificationCenter.default.post(keyboardWillChangeFrameNotification)
        XCTAssertNotNil(viewController.pcView.keyboardWillChangeFrameNotification)
        XCTAssertEqual(viewController.pcView.keyboardWillChangeFrameNotification, keyboardWillChangeFrameNotification)

        let keyboardDidChangeFrameNotification = Notification(name: .UIKeyboardDidChangeFrame, object: nil)

        XCTAssertNil(viewController.pcView.keyboardDidChangeFrameNotification)
        NotificationCenter.default.post(keyboardDidChangeFrameNotification)
        XCTAssertNotNil(viewController.pcView.keyboardDidChangeFrameNotification)
        XCTAssertEqual(viewController.pcView.keyboardDidChangeFrameNotification, keyboardDidChangeFrameNotification)

        let keyboardWillHideNotification = Notification(name: .UIKeyboardWillHide, object: nil)

        XCTAssertNil(viewController.pcView.keyboardWillHideNotification)
        NotificationCenter.default.post(keyboardWillHideNotification)
        XCTAssertNotNil(viewController.pcView.keyboardWillHideNotification)
        XCTAssertEqual(viewController.pcView.keyboardWillHideNotification, keyboardWillHideNotification)

        let keyboardDidHideNotification = Notification(name: .UIKeyboardDidHide, object: nil)

        XCTAssertNil(viewController.pcView.keyboardDidHideNotification)
        NotificationCenter.default.post(keyboardDidHideNotification)
        XCTAssertNotNil(viewController.pcView.keyboardDidHideNotification)
        XCTAssertEqual(viewController.pcView.keyboardDidHideNotification, keyboardDidHideNotification)
    }
    
}
