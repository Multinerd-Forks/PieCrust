//
//  PCViewControllerTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private final class TestViewController: PCViewController {

	var didCallSetTabBarItem = false
	var didCallSetNavigationItem = false
	var didCallSetGestureRecognizers = false

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

}

final class PCViewControllerTests: XCTestCase {

	private func loadTestImage() -> UIImage {
		let bundle = Bundle(for: PCImageViewTests.self)
		let path = bundle.path(forResource: "test_image", ofType: "png")!
		return UIImage(contentsOfFile: path)!
	}

	func testInitFromNib() {
		let viewController1 = PCViewController(nibName: nil, bundle: Bundle(for: PCViewControllerTests.self))
		let viewController2 = PCViewController(nibName: nil, bundle: Bundle(for: PCViewControllerTests.self))
		XCTAssertNotEqual(viewController1, viewController2)
	}

	func testInitFromCoder() {
		let coder = NSKeyedUnarchiver(forReadingWith: Data())
		let viewController = PCViewController(coder: coder)
		XCTAssertNotNil(viewController)
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

	func testPcNavigationController() {
		let viewController = PCViewController()
		let navController = viewController.pcNavigationController
		XCTAssertEqual(viewController.pcNavigationController, navController)
	}

	func testPcTabBarController() {
		let viewController = PCViewController()
		let tabBarController = viewController.pcTabBarController
		XCTAssertEqual(viewController.pcTabBarController, tabBarController)
	}

	func testSetNavigationItemLogo() {
		let image = loadTestImage()

		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 30.0))
		imageView.contentMode = .scaleAspectFit
		imageView.image = loadTestImage()

		let viewController = PCViewController()
		viewController.setNavigationItemLogo(image)

		XCTAssertEqual(viewController.navigationItem.titleView?.frame, imageView.frame)
		XCTAssertEqual(viewController.navigationItem.titleView?.isOpaque, imageView.isOpaque)
	}

}
