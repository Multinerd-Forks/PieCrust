//
//  PCScrollViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCScrollView: PCScrollView {

    var didCallSetViews = false
    var didCallLayoutViews = false

    override func setViews() {
        super.setViews()

        didCallSetViews = true
    }

    override func layoutViews() {
        super.layoutViews()

        didCallLayoutViews = true
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

        let customScrollView = CustomPCScrollView(coder: coder)
        XCTAssertEqual(customScrollView?.didCallSetViews, true)
        XCTAssertEqual(customScrollView?.didCallLayoutViews, true)
    }
}
