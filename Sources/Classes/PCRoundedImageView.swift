//
//  PCRoundedImageView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Rounded `PCImageView`.
open class PCRoundedImageView: PCImageView {

	/// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
	override open var bounds: CGRect {
		didSet {
			cornerRadius = min(bounds.height, bounds.width) / 2.0
		}
	}
	
	/// The image displayed in the image view.
	open override var image: UIImage? {
		didSet {
			cornerRadius = min(bounds.height, bounds.width) / 2.0
		}
	}

}
