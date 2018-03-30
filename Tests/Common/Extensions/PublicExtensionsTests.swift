//
//  PublicExtensionsTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 21.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PublicExtensionsTests: XCTestCase {

    private let tableView = UITableView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let indexPath = IndexPath(item: 0, section: 0)

    override func setUp() {
        super.setUp()

        collectionView.dataSource = self
        collectionView.reloadData()
    }

    func testRegisterReusableViewWithClass() {
        let nilTableHeaderView = tableView.dequeueReusableHeaderFooterView(withClass: UITableViewHeaderFooterView.self)
        XCTAssertNil(nilTableHeaderView)
        tableView.register(headerFooterViewClassWith: UITableViewHeaderFooterView.self)
        let tableHeaderView = tableView.dequeueReusableHeaderFooterView(withClass: UITableViewHeaderFooterView.self)
        XCTAssertNotNil(tableHeaderView)
    }

    func testRegisterCellWithClass() {
        let nilTableViewCell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
        XCTAssertNil(nilTableViewCell)
        tableView.register(cellWithClass: UITableViewCell.self)
        let tableViewCell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
        XCTAssertNotNil(tableViewCell)

        collectionView.register(cellWithClass: UICollectionViewCell.self)
        let collectionViewCell = collectionView.dequeueReusableCell(withClass: UICollectionViewCell.self, for: indexPath)
        XCTAssertNotNil(collectionViewCell)
    }

    func testDequeueReusableCellWithClass() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
        XCTAssertNotNil(cell)
    }

    func testDequeueReusableCellWithClassForIndexPath() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self, for: indexPath)
        XCTAssertNotNil(cell)
    }

    func testDequeueReusableHeaderFooterView() {
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "UITableViewHeaderFooterView")
        let headerFooterView = tableView.dequeueReusableHeaderFooterView(withClass: UITableViewHeaderFooterView.self)
        XCTAssertNotNil(headerFooterView)
    }
}

extension PublicExtensionsTests: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (collectionView == self.collectionView) ? 2 : 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (collectionView == self.collectionView) ? (section == 0 ? 5 : 0) : 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}
