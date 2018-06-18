//
//  UICollectionView+Extensions.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

// MARK: - UICollectionView extensions
public extension UICollectionView {

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
