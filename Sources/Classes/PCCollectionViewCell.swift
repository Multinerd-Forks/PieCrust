//
//  PCCollectionViewCell.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// PCCollectionViewCell.
///
/// - Conforms to:
///   - `Crustable`
///   - `Reusable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCCollectionViewCell: UICollectionViewCell, Crustable, Animatable, Borderable, Shadowable {

	/// Initializes and returns a newly allocated view object with the specified frame rectangle.
	///
	/// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
	override public init(frame: CGRect) {
		super.init(frame: frame)

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
	}

	/// Setup cell and its subviews autolayout here.
	open func setupLayout() {}

}

// MARK: - Reusable
extension PCCollectionViewCell: Reusable {

	/// Reuse identifier _(default is type(of: self))_.
	public static var reuseIdentifier: String {
		return "\(type(of: self))"
	}

}
