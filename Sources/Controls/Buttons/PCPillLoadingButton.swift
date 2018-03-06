//
//  PCPillLoadingButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 23.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCPillLoadingButton.
open class PCPillLoadingButton: PCLoadingButton {

	/// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
    override open var bounds: CGRect {
        didSet {
            cornerRadius = bounds.height / 2.0
        }
    }

}
