//
//  InternalExtensions.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SwifterSwift

// MARK: - Internal Bundle extensions
internal extension Bundle {

    /// Returns PieCrust assets bundle.
	static var PieCrustAssetsBundle: Bundle? {
		let podBundle = Bundle(for: PCViewController.self)
		guard let resourceBundleUrl = podBundle.url(forResource: "PieCrustAssets", withExtension: "bundle") else { return nil }
		guard let resourceBundle = Bundle(url: resourceBundleUrl) else { return nil }
		return resourceBundle
	}

}

// MARK: - Internal UIScreen extensions
internal extension UIScreen {

    /// Check if screen is small.
	var isSmall: Bool {
		return bounds.width < 375
	}

}

// MARK: - Internal UIViewController extensions
internal extension UIViewController {

    /// Creates an alert.
    ///
    /// - Parameters:
    ///   - title: alert title.
    ///   - message: alert message.
    ///   - preferredStyle: alert preferred style _(default is .alert)_.
    ///   - actions: alert actions array _(default is empty)_.
    ///   - animated: wether presentation is animated or not _(default is true)_.
    /// - Returns: UIAlertController instance.
	@discardableResult
	func alert(
		title: String? = nil,
		message: String? = nil,
		preferredStyle: UIAlertControllerStyle = .alert,
		actions: [UIAlertAction] = [],
		animated: Bool = true) -> UIAlertController {

		let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

		if actions.isEmpty {
			let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alert.addAction(okAction)
		}

		for action in actions {
			alert.addAction(action)
		}

		return alert
	}

}
