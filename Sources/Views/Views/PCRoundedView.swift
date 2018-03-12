//
//  PCRoundedView.swift
//  PieCrust
//
//  Created by Omar Albeik on 12.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Rounded version of PCView.
open class PCRoundedView: PCView {

    /// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
    override open var bounds: CGRect {
        didSet {
            cornerRadius = min(bounds.height, bounds.width) / 2.0
        }
    }

}
