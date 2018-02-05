//
//  Extensions.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

internal extension Bundle {
	
	static var iOSAppSkeletonAssetsBundle: Bundle? {
		let podBundle = Bundle(for: ViewController.self)
		guard let resourceBundleUrl = podBundle.url(forResource: "iOSAppSkeletonAssets", withExtension: "bundle") else { return nil }
		guard let resourceBundle = Bundle(url: resourceBundleUrl) else { return nil }
		return resourceBundle
	}
	
}

internal extension UIScreen {
	
	var isSmall: Bool {
		return bounds.width < 375
	}
	
}

public extension Notification {
	
	public var keyboardSize: CGSize? {
		return (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
	}
	
	public var keyboardAnimationDuration: Double? {
		return userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
	}
	
}
