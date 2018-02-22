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

    /// Make navigation controller's navigation bar transparent.
    ///
    /// - Parameter tint: tint color (default is .white).
    public func makeNavigaitonBarTransparent(withTint tint: UIColor = PCColor.white) {
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = .clear
        navigationBar.barTintColor = .clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.tintColor = tint
        navigationBar.titleTextAttributes = [.foregroundColor: tint]
        navigationBar.shadowImage = UIImage()
    }

}
