//
//  PCViewControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCViewController: PCViewController {

    var didCallSetTabBarItem = false
    var didCallSetNavigationItem = false
    var didCallSetGestureRecognizers = false

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

}

enum PieError: Error {
    case invalid
    case whooaa
    case pieError
}

class PCViewControllerTests: XCTestCase {
    
    func testConvenienceInit() {
        let viewController = CustomPCViewController()

        XCTAssertFalse(viewController.shouldEndEditingOnTap)
        XCTAssert(viewController.canBecomeFirstResponder)
    }

    func testSetTabBarItem() {
        let viewController = CustomPCViewController()

        viewController.setTabBarItem()
        XCTAssert(viewController.didCallSetTabBarItem)
    }

    func testSetNavigationItem() {
        let viewController = CustomPCViewController()

        viewController.setNavigationItem()
        XCTAssert(viewController.didCallSetNavigationItem)
    }

    func testSetGestureRecognizers() {
        let viewController = CustomPCViewController()

        viewController.setGestureRecognizers()
        XCTAssert(viewController.didCallSetGestureRecognizers)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let viewController = CustomPCViewController(coder: coder)
        XCTAssertNotNil(viewController)

    }

    func testSetNavigationItemLogo() {
        let viewController = CustomPCViewController()
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
        let viewController = CustomPCViewController()
        XCTAssert(viewController.pcView.isKind(of: PCView.self))
    }

    func testPcNavigationController() {
        let viewController = PCViewController()

        let navController = viewController.pcNavigationController
        XCTAssertEqual(viewController.pcNavigationController, navController)
    }

    func testAlertInit() {
        let viewController = PCViewController()

        viewController.presentAlert(title: "alert", message: "test", preferredStyle: .actionSheet, tintColor: .red, animated: true, completion: nil)

    }

    func testAlertInitWithCompletion() {
        let viewController = PCViewController()
        let alertAction = UIAlertAction(title: "test", style: .cancel)

        viewController.presentAlert(
            title: "alert",
            error: PieError.whooaa,
            preferredStyle: .actionSheet,
            tintColor: .red,
            actions: [alertAction],
            animated: true,
            completion: {
                print("Success")
            })
    }

    func testShowConfetti() {
        let viewController = PCViewController()
        viewController.showConfetti(duration: 1.0, delay: 0.3)
    }
}
