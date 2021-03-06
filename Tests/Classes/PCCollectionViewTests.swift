//
//  PCCollectionViewTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCCollectionViewTests: XCTestCase {

	let collectionView = PCCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
	let indexPath = IndexPath(item: 0, section: 0)
	let headerIndexPath = IndexPath(item: 0, section: 2)

	override func setUp() {
		super.setUp()

		collectionView.dataSource = self
		collectionView.reloadData()
	}

	func testRegisterAndDequeuCell() {
		collectionView.register(PCCollectionViewCell.self, forCellWithReuseIdentifier: PCCollectionViewCell.reuseIdentifier)
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PCCollectionViewCell.reuseIdentifier, for: indexPath)
		XCTAssertNotNil(cell)
	}

	func testInit() {
		let layout = UICollectionViewFlowLayout()

		let view = PCCollectionView(layout: layout, cells: [PCCollectionViewCell.self], allowsSelection: true, allowsMultipleSelection: false, isPagingEnabled: true, showsVerticalScrollIndicator: false, showsHorizontalScrollIndicator: true, scrollIndicatorInsets: .zero, bounces: false, backgroundColor: .green)

		view.dataSource = self
		view.delegate = self

		XCTAssertEqual(view.collectionViewLayout, layout)
		let cell = view.dequeueReusableCell(withReuseIdentifier: PCCollectionViewCell.reuseIdentifier, for: indexPath)
		XCTAssertNotNil(cell)
		XCTAssert(view.allowsSelection)
		XCTAssertFalse(view.allowsMultipleSelection)
		XCTAssert(view.isPagingEnabled)
		XCTAssertFalse(view.showsVerticalScrollIndicator)
		XCTAssert(view.showsHorizontalScrollIndicator)
		XCTAssertEqual(view.alignmentRectInsets, .zero)
		XCTAssertFalse(view.bounces)
		XCTAssertNotNil(view.backgroundColor)
		XCTAssertEqual(view.backgroundColor!, .green)
	}

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension PCCollectionViewTests: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return UICollectionViewCell()
	}

}
