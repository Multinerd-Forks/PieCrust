//
//  PCSegmentedControl.swift
//  PieCrust
//
//  Created by Omar Albeik on 8/6/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCSegmentedControl.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCSegmentedControl: UISegmentedControl, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UISegmentedControl.
public extension Crustable where Self: UISegmentedControl {

	public init(
		items: [Any]?,
		selectedSegmentIndex: Int?,
		normalFont: UIFont? = nil,
		highlightedFont: UIFont? = nil,
		selectedFont: UIFont? = nil,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init(items: items)

		if let index = selectedSegmentIndex {
			self.selectedSegmentIndex = index
		}

		if let normal = normalFont {
			setTitleTextAttributes([NSAttributedStringKey.font: normal], for: .normal)
		}

		if let highlighted = highlightedFont {
			setTitleTextAttributes([NSAttributedStringKey.font: highlighted], for: .highlighted)
		}

		if let selected = selectedFont {
			setTitleTextAttributes([NSAttributedStringKey.font: selected], for: .selected)
		}

		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}
	}

}
