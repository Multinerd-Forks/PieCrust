//
//  UITableView+Extensions.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

// MARK: - UITableView extensions
public extension UITableView {

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
