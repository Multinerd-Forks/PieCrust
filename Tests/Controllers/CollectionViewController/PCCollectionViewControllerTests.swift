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

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationItem()
    }

    @objc func hidedKeyboard() {
        self.view.endEditing(true)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(hidedKeyboard))
        self.view.addGestureRecognizer(tap)
        setGestureRecognizers()
        becomeFirstResponder()
    }

    override var shouldEndEditingOnTap: Bool {
        return true
    }

}

class PCCollectionViewControllerTests: XCTestCase {
    
    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let collectionView = CustomPCCollectionViewController(coder: coder)
        XCTAssert((collectionView?.shouldEndEditingOnTap)!)
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

    func testViewWillAppear() {
        let collectionView = CustomPCCollectionViewController(nibName: nil, bundle: nil)

        collectionView.viewWillAppear(false)
        XCTAssert(collectionView.didCallSetNavigationItem)
    }
    
}
