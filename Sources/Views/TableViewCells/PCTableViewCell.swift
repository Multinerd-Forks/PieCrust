//
//  PCTableViewCell.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCTableViewCell.
///
/// - Conforms to:
///   - PCLayoutable
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCTableViewCell: UITableViewCell, PCLayoutable, PCAnimatable, PCBorderable, PCShadowable {

	/// Initializes a table cell with a style and a reuse identifier and returns it to the caller.
	///
	/// - Parameters:
	///   - style: A constant indicating a cell style. See UITableViewCellStyle for descriptions of these constants.
	///   - reuseIdentifier: A constant indicating a cell style. See UITableViewCellStyle for descriptions of these constants.
	override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setViews()
		layoutViews()
	}

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setViews()
		layoutViews()
	}

	/// Use this method to set and add your custom views.
	open func setViews() {
		backgroundColor = PCColor.white
		selectionStyle = .none
	}

	/// Use this method to layout your custom views using SnapKit.
	open func layoutViews() {}

	/// Preferred padding for autolayout (default is 20).
    /// Override this value by setting `preferredPadding` in `PCConstants` to change it app-wide, or just here to set it for this view only.
	open var preferredPadding: CGFloat {
		return PCConstants.preferredPadding
	}

}
