//
//  PublicExtensions.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

public extension Notification {
	
	public var keyboardSize: CGSize? {
		return (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
	}
	
	public var keyboardAnimationDuration: Double? {
		return userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
	}
	
}

public extension UITableView {
	
	/// Dequeue reusable UITableViewCell using class name
	///
	/// - Parameter name: UITableViewCell type
	/// - Returns: UITableViewCell object with associated class name (optional value)
	public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T? {
		return dequeueReusableCell(withIdentifier: String(describing: name)) as? T
	}
	
	/// Dequeue reusable UITableViewCell using class name for indexPath
	///
	/// - Parameters:
	///   - name: UITableViewCell type.
	///   - indexPath: location of cell in tableView.
	/// - Returns: UITableViewCell object with associated class name.
	public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T? {
		return dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T
	}
	
	/// Dequeue reusable UITableViewHeaderFooterView using class name
	///
	/// - Parameter name: UITableViewHeaderFooterView type
	/// - Returns: UITableViewHeaderFooterView object with associated class name (optional value)
	public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T? {
		return dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T
	}
	
	/// Register UITableViewHeaderFooterView using class name
	///
	/// - Parameters:
	///   - nib: Nib file used to create the header or footer view.
	///   - name: UITableViewHeaderFooterView type.
	public func register<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) {
		register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
	}
	
	/// Register UITableViewHeaderFooterView using class name
	///
	/// - Parameter name: UITableViewHeaderFooterView type
	public func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
		register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
	}
	
	/// Register UITableViewCell using class name
	///
	/// - Parameter name: UITableViewCell type
	public func register<T: UITableViewCell>(cellWithClass name: T.Type) {
		register(T.self, forCellReuseIdentifier: String(describing: name))
	}
	
}
