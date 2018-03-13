//
//  PublicExtensions.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SwifterSwift

public extension Array where Element: UIView {

	/// Creats a PCStackView and adds views in self to it.
	///
	/// - Parameters:
	///   - axis: The axis along which the arranged views are laid out.
	///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis (default is .fill).
	///   - distribution: The distribution of the arranged views along the stack view’s axis (default is .fill).
	///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views (default is 0.0).
	/// - Returns: PCStackView.
	public func stacked(
		axis: UILayoutConstraintAxis,
		alignment: UIStackViewAlignment = .fill,
		distribution: UIStackViewDistribution = .fill,
		spacing: CGFloat = 0.0) -> PCStackView {

		return PCStackView(arrangedSubviews: self, axis: axis, alignment: alignment, distribution: distribution, spacing: spacing)
	}

}

public extension Notification {

	/// Keyboard size from a system notication.
	public var keyboardSize: CGSize? {
		return (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
	}

	/// Estimated keyboard size from a system notication.
	public var estimatedKeyboardSize: CGSize {
		return keyboardSize ?? CGSize(width: UIScreen.main.bounds.width, height: 250.0)
	}

	/// Keyboard animation duration from a system notication.
	public var keyboardAnimationDuration: Double? {
		return userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
	}

	/// Estimated keyboard animation duration from a system notication.
	public var estimatedKeyboardAnimationDuration: Double {
		return keyboardAnimationDuration ?? 0.25
	}

}

public extension UIWindow {

	/// Switch current root view controller with a new view controller.
	///
	/// - Parameters:
	///   - viewController: new view controller.
	///   - animated: set to true to animate view controller change (default is true).
	///   - duration: animation duration in seconds (default is 0.5).
	///   - options: animataion options (default is .transitionFlipFromRight).
	///   - completion: optional completion handler called when view controller is changed.
	public func switchRootViewController(
		_ viewController: UIViewController,
		animated: Bool = true,
		duration: TimeInterval = 0.5,
		options: UIViewAnimationOptions = .transitionFlipFromRight,
		completion: (() -> Void)? = nil) {

		guard animated else {
			rootViewController = viewController
			return
		}

		UIView.transition(with: self, duration: duration, options: options, animations: {
			let oldState = UIView.areAnimationsEnabled
			UIView.setAnimationsEnabled(false)
			self.rootViewController = viewController
			UIView.setAnimationsEnabled(oldState)
		}, completion: { _ in
			completion?()
		})
	}

}

public extension UITableView {

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

}

public extension UICollectionView {

	/// Register UICollectionReusableView using class name.
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

	/// Dequeue reusable UICollectionViewCell using class name.
	///
	/// - Parameters:
	///   - name: UICollectionViewCell type.
	///   - indexPath: location of cell in collectionView.
	/// - Returns: UICollectionViewCell object with associated class name.
	public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T? {
		return dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T
	}

	/// Dequeue reusable UICollectionReusableView using class name.
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
