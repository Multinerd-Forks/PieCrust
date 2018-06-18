//
//  PCViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCViewController.
///
/// - Conforms to:
///   - `Crustable`
open class PCViewController: UIViewController, Crustable {

	/// Returns a newly initialized view controller with the nib file in the specified bundle.
	///
	/// - Parameters:
	///   - nibNameOrNil: The name of the nib file to associate with the view controller. The nib file name should not contain any leading path information. If you specify nil, the nibName property is set to nil.
	///   - nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory. If this parameter is nil, the method uses the heuristics described below to locate the nib file.
	override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

		setTabBarItem()
	}

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setTabBarItem()
	}

	/// Called after the controller's view is loaded into memory.
	override open func viewDidLoad() {
		super.viewDidLoad()

		setGestureRecognizers()
		becomeFirstResponder()
	}

	/// Notifies the view controller that its view is about to be added to a view hierarchy.
	///
	/// - Parameter animated: If true, the view is being added to the window using an animation.
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setNavigationItem()
	}

	/// Set tab bar item here.
	open func setTabBarItem() {}

	/// Set navigation item here.
	open func setNavigationItem() {}

	/// Set gesture recognizers here.
	open func setGestureRecognizers() {}

}

// MARK: - Default implementation for UIViewController.
public extension Crustable where Self: UIViewController {

	/// The nearest ancestor in the view controller hierarchy that is a `PCNavigationController`.
	public var pcNavigationController: PCNavigationController? {
		return navigationController as? PCNavigationController
	}

	/// The nearest ancestor in the view controller hierarchy that is a `PCTabBarController`.
	public var pcTabBarController: PCTabBarController? {
		return tabBarController as? PCTabBarController
	}

	/// Set Navigation Item logo image.
	///
	/// - Parameter image: logo image.
	public func setNavigationItemLogo(_ image: UIImage) {
		let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 30.0))
		logoImageView.contentMode = .scaleAspectFit
		logoImageView.image = image
		navigationItem.titleView = logoImageView
	}

}
