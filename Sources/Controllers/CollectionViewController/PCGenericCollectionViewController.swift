//
//  PCGenericCollectionViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 9.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// Generic PCCollectionViewController.
open class PCGenericCollectionViewController<T: PCGenericCollectionViewCell<U>, U>: PCCollectionViewController {

    /// Returns a newly initialized view controller with the nib file in the specified bundle and a given items array.
	///
	/// - Parameters:
	///   - nibNameOrNil: The name of the nib file to associate with the view controller. The nib file name should not contain any leading path information. If you specify nil, the nibName property is set to nil.
	///   - nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory. If this parameter is nil, the method uses the heuristics described below to locate the nib file.
	///   - items: Generic items array of arrays, where each internal array represents a section.
    public convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, items: [[U]]) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.items = items
    }

	/// Returns a newly initialized view controller with the nib file in the specified bundle.
	///
	/// - Parameters:
	///   - nibNameOrNil: The name of the nib file to associate with the view controller. The nib file name should not contain any leading path information. If you specify nil, the nibName property is set to nil.
	///   - nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory. If this parameter is nil, the method uses the heuristics described below to locate the nib file.
	override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        registerCell()
    }

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
	required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        registerCell()
    }

    /// Generic items array of arrays, where each internal array represents a section.
    open var items: [[U]] = [[]]

    private func registerCell() {
        collectionView?.register(cellWithClass: T.self)
    }

    /// Asks your data source object for the number of sections in the collection view.
    ///
    /// - Parameter collectionView: The collection view requesting this information.
    /// - Returns: The number of sections in collectionView.
    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }

	/// Asks your data source object for the number of items in the specified section.
	///
	/// - Parameters:
	///   - collectionView: The collection view requesting this information.
	///   - section: An index number identifying a section in collectionView. This index value is 0-based.
	/// - Returns: The number of rows in section.
	open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items[section].count
	}

    /// Asks your data source object for the cell that corresponds to the specified item in the collection view.
    ///
    /// - Parameters:
    ///   - collectionView: The collection view requesting this information.
    ///   - indexPath: The index path that specifies the location of the item.
    /// - Returns: A configured cell object. You must not return nil from this method.
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: T.self, for: indexPath)!
        cell.item = items[indexPath.section][indexPath.item]
        return cell
    }

}
