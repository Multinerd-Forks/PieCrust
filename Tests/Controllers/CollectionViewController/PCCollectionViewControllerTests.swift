//
//  PCCollectionViewControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPCCollectionViewController: PCCollectionViewController {

    var didCallSetTabBarItem = false
    var didCallSetNavigationItem = false
    var didCallSetGestureRecognizers = false
    var didCallShouldEndEditingOnTap = false

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

class PCCollectionViewControllerTests: XCTestCase {
    
    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let collectionView = CustomPCCollectionViewController(coder: coder)
        XCTAssertFalse((collectionView?.shouldEndEditingOnTap)!)
        XCTAssertTrue((collectionView?.canBecomeFirstResponder)!)
        XCTAssertEqual(collectionView?.didCallSetTabBarItem, true)
    }

    func testSetTabBarItem() {
        let collectionView = CustomPCCollectionViewController(nibName: nil, bundle: nil)

        collectionView.setTabBarItem()
        XCTAssert(collectionView.didCallSetTabBarItem)
    }

    func testSetGestureRecognizers() {
         let collectionView = CustomPCCollectionViewController(nibName: nil, bundle: nil)

        collectionView.setGestureRecognizers()
        XCTAssert(collectionView.didCallSetGestureRecognizers)
    }

    func testSetNavigationItem() {
         let collectionView = CustomPCCollectionViewController(nibName: nil, bundle: nil)

        collectionView.setNavigationItem()
        XCTAssert(collectionView.didCallSetNavigationItem)
    }
    
}
