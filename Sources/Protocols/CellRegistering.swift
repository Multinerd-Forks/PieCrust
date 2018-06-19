//
//  CellRegistering.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to `CellRegistering` protocol to register cells in a UITableView or UICollectionView.
public protocol CellRegistering: AnyObject {}

// MARK: - Default implementation for UITableView.
public extension CellRegistering where Self: UITableView {

	/// Register UITableViewHeaderFooterView using its class name.
	///
	/// - Parameter name: UITableViewHeaderFooterView type.
	public func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
		register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
	}

	/// Register UITableViewCell using its class name.
	///
	/// - Parameter name: UITableViewCell type.
	public func register<T: UITableViewCell>(cellWithClass name: T.Type) {
		register(T.self, forCellReuseIdentifier: String(describing: name))
	}

}

// MARK: - Default implementation for UICollectionView.
public extension CellRegistering where Self: UICollectionView {

	/// Register UICollectionReusableView using its class name.
	///
	/// - Parameters:
	///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
	///   - name: UICollectionReusableView type.
	public func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
		register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
	}

	/// Register UICollectionViewCell using class name.
	///
	/// - Parameter name: UICollectionViewCell type.
	public func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
		register(T.self, forCellWithReuseIdentifier: String(describing: name))
	}

}
