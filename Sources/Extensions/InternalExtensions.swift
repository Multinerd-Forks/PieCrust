//
//  InternalExtensions.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

internal extension Bundle {
	
	internal static var PieCrustAssetsBundle: Bundle? {
		let podBundle = Bundle(for: PCViewController.self)
		guard let resourceBundleUrl = podBundle.url(forResource: "PieCrustAssets", withExtension: "bundle") else { return nil }
		guard let resourceBundle = Bundle(url: resourceBundleUrl) else { return nil }
		return resourceBundle
	}
	
}

internal extension UIScreen {
	
	internal var isSmall: Bool {
		return bounds.width < 375
	}
	
}

internal extension UIViewController {

	@discardableResult
	internal func alert(
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
