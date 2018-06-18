//
//  PCTableViewCell.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTableViewCell.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCTableViewCell: UITableViewCell, Crustable, Animatable, Borderable, Shadowable {

	/// Initializes a table cell with a style and a reuse identifier and returns it to the caller.
	///
	/// - Parameters:
	///   - style: A constant indicating a cell style. See UITableViewCellStyle for descriptions of these constants.
	///   - reuseIdentifier: A constant indicating a cell style. See UITableViewCellStyle for descriptions of these constants.
	public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupViews()
		setupLayout()
	}

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setupViews()
		setupLayout()
	}

	/// Setup cell and its subviews here.
	open func setupViews() {
		backgroundColor = .white
		selectionStyle = .none
	}

	/// Setup cell and its subviews autolayout here.
	open func setupLayout() {}

}
