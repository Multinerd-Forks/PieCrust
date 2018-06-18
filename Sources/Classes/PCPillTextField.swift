//
//  PCPillTextField.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Pill `PCTextField`.
open class PCPillTextField: PCTextField {

	/// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
	override open var bounds: CGRect {
		didSet {
			cornerRadius = bounds.height / 2
		}
	}

}
