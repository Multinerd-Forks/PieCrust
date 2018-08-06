//
//  PCTableViewHeaderFooterView.swift
//  PieCrust
//
//  Created by Omar Albeik on 8/6/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTableViewHeaderFooterView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Reusable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCTableViewHeaderFooterView: UITableViewHeaderFooterView, Crustable, Animatable, Borderable, Shadowable {

	/// Initializes a table header/footer view with a reuse identifier and returns it to the caller.
	///
	/// - Parameters:
	///   - reuseIdentifier: A string used to identify the header or footer view if it is to be reused by multiple sections. Pass nil if the view is not to be reused. You should use the same reuse identifier for all header or footer views of the same form.
	public override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)

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

	/// Setup view and its subviews here.
	open func setupViews() {
		backgroundColor = .white
	}

	/// Setup view and its subviews autolayout here.
	open func setupLayout() {}

}

// MARK: - Reusable
extension PCTableViewHeaderFooterView: Reusable {

	/// Reuse identifier _(default is type(of: self))_.
	public static var reuseIdentifier: String {
		return "\(type(of: self))"
	}

}
