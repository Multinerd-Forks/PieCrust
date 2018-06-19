//
//  CellDiqueing.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to `CellDiqueing` protocol to dequeue cells from a UITableView or UICollectionView.
public protocol CellDiqueing: AnyObject {}

// MARK: - Default implementation for UITableView.
public extension CellDiqueing where Self: UITableView {

	/// Dequeue reusable UITableViewCell using its class name.
	///
	/// - Parameter name: UITableViewCell type.
	/// - Returns: UITableViewCell object with associated class name _(optional value)_.
	public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T? {
		return dequeueReusableCell(withIdentifier: String(describing: name)) as? T
	}

	/// Dequeue reusable UITableViewCell using class name for indexPath.
	///
	/// - Parameters:
	///   - name: UITableViewCell type.
	///   - indexPath: location of cell in tableView.
	/// - Returns: UITableViewCell object with associated class name.
	public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T? {
		return dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T
	}

	/// Dequeue reusable UITableViewHeaderFooterView using its class name.
	///
	/// - Parameter name: UITableViewHeaderFooterView type.
	/// - Returns: UITableViewHeaderFooterView object with associated class name _(optional value)_.
	public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T? {
		return dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T
	}

}

// MARK: - Default implementation for UICollectionView.
public extension CellDiqueing where Self: UICollectionView {

	/// Dequeue reusable UICollectionViewCell using its class name.
	///
	/// - Parameters:
	///   - name: UICollectionViewCell type.
	///   - indexPath: location of cell in collectionView.
	/// - Returns: UICollectionViewCell object with associated class name.
	public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T? {
		return dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T
	}

	/// Dequeue reusable UICollectionReusableView using its class name.
	///
	/// - Parameters:
	///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
	///   - name: UICollectionReusableView type.
	///   - indexPath: location of cell in collectionView.
	/// - Returns: UICollectionReusableView object with associated class name.
	public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, withClass name: T.Type, for indexPath: IndexPath) -> T? {
		return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: name), for: indexPath) as? T
	}

}
