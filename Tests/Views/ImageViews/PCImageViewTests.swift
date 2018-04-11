//
//  PCImageViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 15.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestViewController: PCViewController {

    override func loadView() {
        view = TestImageView()
    }

    var pcImageView: TestImageView {
        return view as! TestImageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardEvents()
    }

    override func keyboardWillShow(_ notification: Notification) {
        pcImageView.handleKeyboardWillShow(notification)
    }

    override func keyboardDidShow(_ notification: Notification) {
        pcImageView.handleKeyboardDidShow(notification)
    }

    override func keyboardWillChangeFrame(_ notification: Notification) {
        pcImageView.handleKeyboardWillChangeFrame(notification)
    }

    override func keyboardDidChangeFrame(_ notification: Notification) {
        pcImageView.handleKeyboardDidChangeFrame(notification)
    }

    override func keyboardWillHide(_ notification: Notification) {
        pcImageView.handleKeyboardWillHide(notification)
    }

    override func keyboardDidHide(_ notification: Notification) {
        pcImageView.handleKeyboardDidHide(notification)
    }

    deinit {
        unregisterFromKeyboardEvents()
    }

}

private class TestImageView: PCImageView {

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

class PCImageViewTests: XCTestCase {

    let image = UIImage(named: "piecrust.png")
    
    func testConvenienceInit() {
        let imageView = PCImageView()
        XCTAssertNil(imageView.image)
        XCTAssertNil(imageView.highlightedImage)

        let highlightedImageView: PCImageView = PCImageView( image: image, highlightedImage: image)
        XCTAssertEqual(highlightedImageView.image, image)
        XCTAssertEqual(highlightedImageView.highlightedImage, image)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let pcImageView = PCImageView(coder: coder)
        XCTAssertNotNil(pcImageView)

        let customImageView = TestImageView(coder: coder)
        XCTAssertNotNil(customImageView)
        XCTAssert(customImageView!.didCallSetViews)
        XCTAssert(customImageView!.didCallLayoutViews)
    }

    func testSetViews() {
        let imageView = PCImageView()
        
        XCTAssertEqual(imageView.backgroundColor, PCColor.white)
    }

    func testKeyboardMethods() {
        let viewController = TestViewController()
        viewController.viewDidLoad()

        let keyboardWillShowNotification = Notification(name: .UIKeyboardWillShow, object: nil)

        XCTAssertNil(viewController.pcImageView.keyboardWillShowNotification)
        NotificationCenter.default.post(keyboardWillShowNotification)
        XCTAssertNotNil(viewController.pcImageView.keyboardWillShowNotification)
        XCTAssertEqual(viewController.pcImageView.keyboardWillShowNotification, keyboardWillShowNotification)

        let keyboardDidShowNotification = Notification(name: .UIKeyboardDidShow, object: nil)

        XCTAssertNil(viewController.pcImageView.keyboardDidShowNotification)
        NotificationCenter.default.post(keyboardDidShowNotification)
        XCTAssertNotNil(viewController.pcImageView.keyboardDidShowNotification)
        XCTAssertEqual(viewController.pcImageView.keyboardDidShowNotification, keyboardDidShowNotification)

        let keyboardWillChangeFrameNotification = Notification(name: .UIKeyboardWillChangeFrame, object: nil)

        XCTAssertNil(viewController.pcImageView.keyboardWillChangeFrameNotification)
        NotificationCenter.default.post(keyboardWillChangeFrameNotification)
        XCTAssertNotNil(viewController.pcImageView.keyboardWillChangeFrameNotification)
        XCTAssertEqual(viewController.pcImageView.keyboardWillChangeFrameNotification, keyboardWillChangeFrameNotification)

        let keyboardDidChangeFrameNotification = Notification(name: .UIKeyboardDidChangeFrame, object: nil)

        XCTAssertNil(viewController.pcImageView.keyboardDidChangeFrameNotification)
        NotificationCenter.default.post(keyboardDidChangeFrameNotification)
        XCTAssertNotNil(viewController.pcImageView.keyboardDidChangeFrameNotification)
        XCTAssertEqual(viewController.pcImageView.keyboardDidChangeFrameNotification, keyboardDidChangeFrameNotification)

        let keyboardWillHideNotification = Notification(name: .UIKeyboardWillHide, object: nil)

        XCTAssertNil(viewController.pcImageView.keyboardWillHideNotification)
        NotificationCenter.default.post(keyboardWillHideNotification)
        XCTAssertNotNil(viewController.pcImageView.keyboardWillHideNotification)
        XCTAssertEqual(viewController.pcImageView.keyboardWillHideNotification, keyboardWillHideNotification)

        let keyboardDidHideNotification = Notification(name: .UIKeyboardDidHide, object: nil)

        XCTAssertNil(viewController.pcImageView.keyboardDidHideNotification)
        NotificationCenter.default.post(keyboardDidHideNotification)
        XCTAssertNotNil(viewController.pcImageView.keyboardDidHideNotification)
        XCTAssertEqual(viewController.pcImageView.keyboardDidHideNotification, keyboardDidHideNotification)
    }

}
