//
//  PCCollectionView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCCollectionView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
///   - `CellRegistering`
///   - `CellDiqueing`
open class PCCollectionView: UICollectionView, Crustable, Animatable, Borderable, Shadowable, CellRegistering, CellDiqueing {}

// MARK: - Default implementation for UICollectionView.
public extension Crustable where Self: UICollectionView & CellRegistering {

	/// Creates and returns a new UICollectionView with setting its cells and properties in one line.
	///
	/// - Parameters:
	///   - layout: collection view layout.
	///   - cells: cell classes to register by default.
	///   - allowsSelection: A Boolean value that determines whether users can select a row _(default is true)_.
	///   - allowsMultipleSelection: A Boolean value that determines whether users can select more than one row outside of editing mode _(default is false)_.
	///   - isPagingEnabled: A Boolean value that determines whether paging is enabled for the collection view. _(default is false)_.
	///   - showsVerticalScrollIndicator: A Boolean value that controls whether the vertical scroll indicator is visible _(default is true)_.
	///   - showsHorizontalScrollIndicator: A Boolean value that controls whether the horizontal scroll indicator is visible _(default is true)_.
	///   - scrollIndicatorInsets: The distance the scroll indicators are inset from the edge of the scroll view _(default is .zero)_.
	///   - bounces: A Boolean value that controls whether the scroll view bounces past the edge of content and back again _(default is true)_.
	///   - backgroundColor: background color _(default is .white)_.
	public init(
		layout: UICollectionViewLayout,
		cells: [UICollectionViewCell.Type],
		allowsSelection: Bool = true,
		allowsMultipleSelection: Bool = false,
		isPagingEnabled: Bool = false,
		showsVerticalScrollIndicator: Bool = true,
		showsHorizontalScrollIndicator: Bool = true,
		scrollIndicatorInsets: UIEdgeInsets = .zero,
		bounces: Bool = true,
		backgroundColor: UIColor? = .white) {

		self.init(frame: .zero, collectionViewLayout: layout)

		for cell in cells {
			register(cell, forCellWithReuseIdentifier: String(describing: cell))
		}

		self.allowsSelection = allowsSelection
		self.allowsMultipleSelection = allowsMultipleSelection
		self.isPagingEnabled = isPagingEnabled
		self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
		self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
		self.scrollIndicatorInsets = scrollIndicatorInsets
		self.bounces = bounces

		self.backgroundColor = backgroundColor

	}

}
