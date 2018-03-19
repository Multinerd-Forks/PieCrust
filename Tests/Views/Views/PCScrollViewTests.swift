//
//  PCScrollViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCScrollViewTests: XCTestCase {

    func testSetView() {
        let pcScrollView = PCScrollView()
        XCTAssertEqual(pcScrollView.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let pcScrollViewWithCustomFrame = PCScrollView(frame: frame)
        XCTAssertEqual(pcScrollViewWithCustomFrame.frame, frame)
    }

    func testConvenienceInit() {
        let scrollView = PCScrollView()
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

        let customScroll = PCScrollView(isScrollEnabled: false, isDirectionalLockEnabled: true, isPagingEnabled: true, scrollsToTop: false, bounces: false, alwaysBounceVertical: true, alwaysBounceHorizontal: true, minimumZoomScale: 2.0, maximumZoomScale: 2.0, bouncesZoom: false, keyboardDismissMode: .onDrag, backgroundColor: PCColor.green, tintColor: PCColor.blue, alpha: 0.5)

        XCTAssertFalse(customScroll.isScrollEnabled)
        XCTAssertTrue(customScroll.isDirectionalLockEnabled)
        XCTAssertTrue(customScroll.isPagingEnabled)
        XCTAssertFalse(customScroll.scrollsToTop)
        XCTAssertFalse(customScroll.bounces)
        XCTAssertTrue(customScroll.alwaysBounceVertical)
        XCTAssertTrue(customScroll.alwaysBounceHorizontal)
        XCTAssertEqual(customScroll.minimumZoomScale, 2.0)
        XCTAssertEqual(customScroll.maximumZoomScale, 2.0)
        XCTAssertFalse(customScroll.bouncesZoom)

    }
}
