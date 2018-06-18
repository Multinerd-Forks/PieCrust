//
//  Bundle+Extensions.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

// MARK: - Bundle extensions.
internal extension Bundle {

	/// Returns PieCrust assets bundle.
	static var PieCrustAssetsBundle: Bundle? {
		let podBundle = Bundle(for: PCViewController.self)
		guard let resourceBundleUrl = podBundle.url(forResource: "PieCrustAssets", withExtension: "bundle") else { return nil }
		guard let resourceBundle = Bundle(url: resourceBundleUrl) else { return nil }
		return resourceBundle
	}

}
