//
//  UICollectionViewExtensionsTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class UICollectionViewExtensionsTests: XCTestCase {

	let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
	let indexPath = IndexPath(item: 0, section: 0)
	let headerIndexPath = IndexPath(item: 0, section: 2)

	override func setUp() {
		super.setUp()

		collectionView.dataSource = self
		collectionView.reloadData()
	}

	func testRegisterAndDequeuCell() {
		collectionView.register(cellWithClass: UICollectionViewCell.self)
		let cell = collectionView.dequeueReusableCell(withClass: UICollectionViewCell.self, for: indexPath)
		XCTAssertNotNil(cell)
	}

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension UICollectionViewExtensionsTests: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

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
