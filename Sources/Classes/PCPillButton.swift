//
//  PCPillButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Pill `PCButton`.
open class PCPillButton: PCButton {

	/// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
	override open var bounds: CGRect {
		didSet {
			cornerRadius = bounds.height / 2
		}
	}

}
