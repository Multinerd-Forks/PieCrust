//
//  PCScrollViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestView: PCScrollView {

	var didCallSetupViews = false
	var didCallSetupLayout = false

	override func setupViews() {
		super.setupViews()

		didCallSetupViews = true
	}

	override func setupLayout() {
		super.setupLayout()

		didCallSetupLayout = true
	}

	var preferredPadding: CGFloat {
		return 10.0
	}

}

final class PCScrollViewTests: XCTestCase {

	func testInit() {
		let view = TestView()
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitWithFrame() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let pcView = PCScrollView(frame: frame)
		XCTAssertEqual(pcView.frame, frame)
		XCTAssertEqual(pcView.preferredPadding, 20)

		let view = TestView(frame: frame)
		XCTAssertEqual(view.frame, frame)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcView = PCScrollView(coder: coder)
		XCTAssertNotNil(pcView)
		XCTAssertEqual(pcView!.preferredPadding, 20)

		let view = TestView(coder: coder)
		XCTAssertNotNil(view)
		XCTAssert(view!.didCallSetupViews)
		XCTAssert(view!.didCallSetupLayout)
		XCTAssertEqual(view!.backgroundColor, .white)
		XCTAssertEqual(view!.preferredPadding, 10)
	}

	func testConvenienceInit() {
		let scrollView = PCScrollView(
			isScrollEnabled: false,
			isDirectionalLockEnabled: true,
			isPagingEnabled: true,
			scrollsToTop: false,
			bounces: false,
			alwaysBounceVertical: true,
			alwaysBounceHorizontal: true,
			minimumZoomScale: 1.5,
			maximumZoomScale: 2.0,
			bouncesZoom: false,
			keyboardDismissMode: .onDrag,
			backgroundColor: .green,
			tintColor: .blue)

		XCTAssertFalse(scrollView.isScrollEnabled)
		XCTAssertTrue(scrollView.isDirectionalLockEnabled)
		XCTAssertTrue(scrollView.isPagingEnabled)
		XCTAssertFalse(scrollView.scrollsToTop)
		XCTAssertFalse(scrollView.bounces)
		XCTAssertTrue(scrollView.alwaysBounceVertical)
		XCTAssertTrue(scrollView.alwaysBounceHorizontal)
		XCTAssertEqual(scrollView.minimumZoomScale, 1.5)
		XCTAssertEqual(scrollView.maximumZoomScale, 2.0)
		XCTAssertFalse(scrollView.bouncesZoom)
		XCTAssertEqual(scrollView.keyboardDismissMode, .onDrag)
		XCTAssertNotNil(scrollView.backgroundColor)
		XCTAssertEqual(scrollView.backgroundColor!, .green)
		XCTAssertEqual(scrollView.tintColor, .blue)

	}

}
