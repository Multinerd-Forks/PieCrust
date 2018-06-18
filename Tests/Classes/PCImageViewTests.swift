//
//  PCImageViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestImageView: PCImageView {

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

final class PCImageViewTests: XCTestCase {

	private func loadTestImage() -> UIImage {
		let bundle = Bundle(for: PCImageViewTests.self)
		let path = bundle.path(forResource: "test_image", ofType: "png")!
		return UIImage(contentsOfFile: path)!
	}

	func testInit() {
		let view = TestImageView()
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitWithFrame() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let pcView = PCImageView(frame: frame)
		XCTAssertEqual(pcView.frame, frame)
		XCTAssertEqual(pcView.preferredPadding, 20)

		let view = TestImageView(frame: frame)
		XCTAssertEqual(view.frame, frame)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let pcView = PCImageView(coder: coder)
		XCTAssertNotNil(pcView)
		XCTAssertEqual(pcView!.preferredPadding, 20)

		let view = TestImageView(coder: coder)
		XCTAssertNotNil(view)
		XCTAssert(view!.didCallSetupViews)
		XCTAssert(view!.didCallSetupLayout)
		XCTAssertEqual(view!.backgroundColor, .white)
		XCTAssertEqual(view!.preferredPadding, 10)
	}

	func testInitWithImage() {
		let image = loadTestImage()
		let pcView = PCImageView(image: image)
		XCTAssertNotNil(pcView.image)
		XCTAssertEqual(pcView.image!, image)

		let view = TestImageView(image: image)
		XCTAssertNotNil(view.image)
		XCTAssertEqual(view.image!, image)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testInitWithImageAndHighlightedImage() {
		let image = loadTestImage()
		let pcView = PCImageView(image: image, highlightedImage: image)
		XCTAssertNotNil(pcView.image)
		XCTAssertNotNil(pcView.highlightedImage)
		XCTAssertEqual(pcView.image!, image)
		XCTAssertEqual(pcView.highlightedImage!, image)

		let view = TestImageView(image: image, highlightedImage: image)
		XCTAssertNotNil(view.image)
		XCTAssertNotNil(view.highlightedImage)
		XCTAssertEqual(view.image!, image)
		XCTAssertEqual(view.highlightedImage!, image)
		XCTAssert(view.didCallSetupViews)
		XCTAssert(view.didCallSetupLayout)
		XCTAssertEqual(view.backgroundColor, .white)
		XCTAssertEqual(view.preferredPadding, 10)
	}

	func testConvenienceInit() {
		let image = loadTestImage()
		let view = PCImageView(image: image, contentMode: .center, backgroundColor: .red, tintColor: .blue)
		XCTAssertNotNil(view.image)
		XCTAssertEqual(view.image!, image)
		XCTAssertEqual(view.contentMode, .center)
		XCTAssertNotNil(view.backgroundColor)
		XCTAssertEqual(view.backgroundColor!, .red)
		XCTAssertEqual(view.tintColor, .blue)
	}

}
