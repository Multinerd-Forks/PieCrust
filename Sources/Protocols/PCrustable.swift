//
//  PCrustable.swift
//  PieCrust
//
//  Created by Omar Albeik on 23.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to PCrustable to set view controllers in code.
public protocol PCrustable: class {

	/// Set tab bar item here.
	func setTabBarItem()

	/// Set navigation item here.
	func setNavigationItem()

	/// Set gesture recognizers here.
	func setGestureRecognizers()

	/// Set Navigation Item logo image.
	///
	/// - Parameter image: logo image.
	func setNavigationItemLogo(_ image: UIImage)

}

extension PCrustable where Self: UIViewController {

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
