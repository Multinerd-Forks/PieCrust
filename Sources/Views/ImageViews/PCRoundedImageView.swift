//
//  PCRoundedImageView.swift
//  PieCrust
//
//  Created by Omar Albeik on 21.02.2018.
//

import UIKit

/// PCRoundedImageView
open class PCRoundedImageView: PCImageView {

    /// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
    override open var bounds: CGRect {
        didSet {
            clipsToBounds = true
            layer.cornerRadius = min(bounds.size.width, bounds.size.height) / 2
        }
    }

}
