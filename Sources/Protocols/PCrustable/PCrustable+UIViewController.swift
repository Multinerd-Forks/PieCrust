//
//  PCrustable+UIViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UIViewController
public extension PCrustable where Self: UIViewController {

    /// Set tab bar item here.
    public func setTabBarItem() {}

    /// Set navigation item here.
    public func setNavigationItem() {}

    /// Set gesture recognizers here.
    public func setGestureRecognizers() {}

    /// Set Navigation Item logo image.
    ///
    /// - Parameter image: logo image.
    public func setNavigationItemLogo(_ image: UIImage) {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 30.0))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = image
        navigationItem.titleView = logoImageView
    }

	/// The nearest ancestor in the view controller hierarchy that is a `PCNavigationController`.
	public var pcNavigationController: PCNavigationController? {
		return navigationController as? PCNavigationController
	}

	/// The nearest ancestor in the view controller hierarchy that is a `PCTabBarController`.
	public var pcTabBarController: PCTabBarController? {
		return tabBarController as? PCTabBarController
	}

	/// The `PCView` that the controller manages.
	public var pcView: PCView {
		return view as! PCView
	}

}
