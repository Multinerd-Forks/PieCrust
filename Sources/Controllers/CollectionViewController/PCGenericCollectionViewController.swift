//
//  PCGenericCollectionViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 9.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Generic PCCollectionViewController.
open class PCGenericCollectionViewController<T: PCGenericCollectionViewCell<U>, U>: PCCollectionViewController {

    public convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, items: [[U]]) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.items = items
    }

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        registerCell()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        registerCell()
    }

    /// Generic items array.
    open var items: [[U]] = [[]]

    private func registerCell() {
        collectionView?.register(cellWithClass: T.self)
    }

    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }

    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: T.self, for: indexPath)!
        cell.item = items[indexPath.section][indexPath.item]
        return cell
    }

}
