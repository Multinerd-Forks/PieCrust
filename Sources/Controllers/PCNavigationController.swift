//
//  PCNavigationController.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCNavigationController.
open class PCNavigationController: UINavigationController, PCAlertable, PCConfettiable {

	/// The nearest ancestor in the view controller hierarchy that is a PCTabBarController.
	open var pcTabBarController: PCTabBarController? {
		return tabBarController as? PCTabBarController
	}

    /// Called after the controller's view is loaded into memory.
	open override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = PCColor.white
	}

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
