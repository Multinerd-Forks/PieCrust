//
//  PCNavigationController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCNavigationController.
///
/// - Conforms to:
///   - `Crustable`
open class PCNavigationController: UINavigationController, Crustable {}

// MARK: - Default implementation for UINavigationController.
public extension Crustable where Self: UINavigationController {

	/// Set navigationBar background and text colors
	///
	/// - Parameters:
	///   - background: backgound color
	///   - text: text color
	public func setNavigaitonBarColors(background: UIColor, tint: UIColor) {
		navigationBar.isTranslucent = (background == .clear)
		navigationBar.backgroundColor = background
		navigationBar.barTintColor = background
		navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationBar.tintColor = tint
		navigationBar.titleTextAttributes = [.foregroundColor: tint]
		navigationBar.shadowImage = UIImage()
	}

}
