//
//  PCTableView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTableView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
///   - `CellRegistering`
///   - `CellDiqueing`
open class PCTableView: UITableView, Crustable, Animatable, Borderable, Shadowable, CellRegistering, CellDiqueing {}

// MARK: - Default implementation for UITableView.
public extension Crustable where Self: UITableView & CellRegistering {

	/// Creates and returns a new UITableView with setting its cells and properties in one line.
	///
	/// - Parameters:
	///   - style: A constant that specifies the style of the table view. See UITableViewStyle for descriptions of valid constants _(default is .plain)_.
	///   - cells: cell classes to register by default.
	///   - allowsSelection: A Boolean value that determines whether users can select a row _(default is true)_.
	///   - allowsMultipleSelection: A Boolean value that determines whether users can select more than one row outside of editing mode _(default is false)_.
	///   - isPagingEnabled: A Boolean value that determines whether paging is enabled for the table view. _(default is false)_.
	///   - showsVerticalScrollIndicator: A Boolean value that controls whether the vertical scroll indicator is visible _(default is true)_.
	///   - separatorStyle: The style for table cells used as separators _(default is .singleLine)_.
	///   - separatorColor: The color of separator rows in the table view _(default is .gray)_.
	///   - separatorInset: Specifies the default inset of cell separators _(default is .zero)_.
	///   - scrollIndicatorInsets: The distance the scroll indicators are inset from the edge of the scroll view _(default is .zero)_.
	///   - bounces: A Boolean value that controls whether the scroll view bounces past the edge of content and back again _(default is true)_.
	///   - tableHeaderView: An accessory view that is displayed above the table _(default is nil)_.
	///   - tableFooterView: An accessory view that is displayed below the table _(default is nil)_.
	///   - backgroundColor: background color _(default is .white)_.
	public init(
		style: UITableViewStyle = .plain,
		cells: [UITableViewCell.Type],
		allowsSelection: Bool = true,
		allowsMultipleSelection: Bool = false,
		isPagingEnabled: Bool = false,
		showsVerticalScrollIndicator: Bool = true,
		separatorStyle: UITableViewCellSeparatorStyle = .singleLine,
		separatorColor: UIColor? = .gray,
		separatorInset: UIEdgeInsets = .zero,
		scrollIndicatorInsets: UIEdgeInsets = .zero,
		bounces: Bool = true,
		tableHeaderView: UIView? = nil,
		tableFooterView: UIView? = nil,
		backgroundColor: UIColor? = .white) {

		self.init(frame: .zero, style: style)

		for cell in cells {
			register(cell, forCellReuseIdentifier: String(describing: cell))
		}

		self.allowsSelection = allowsSelection
		self.allowsMultipleSelection = allowsMultipleSelection
		self.isPagingEnabled = isPagingEnabled
		self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
		self.separatorStyle = separatorStyle
		self.separatorColor = separatorColor
		self.separatorInset = separatorInset
		self.scrollIndicatorInsets = scrollIndicatorInsets
		self.bounces = bounces

		if let header = tableHeaderView {
			self.tableHeaderView = header
		}

		if let footer = tableFooterView {
			self.tableFooterView = footer
		}

		self.backgroundColor = backgroundColor
	}

}
