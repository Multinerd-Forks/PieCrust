//
//  PCRoundedImageView.swift
//  PieCrust
//
//  Created by Omar Albeik on 21.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCRoundedImageView
open class PCRoundedImageView: PCImageView {

    /// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
    override open var bounds: CGRect {
        didSet {
            layer.cornerRadius = min(bounds.size.width, bounds.size.height) / 2.0
            clipsToBounds = true
        }
    }

    /// The image displayed in the image view.
    open override var image: UIImage? {
        didSet {
            layer.cornerRadius = min(bounds.size.width, bounds.size.height) / 2.0
            clipsToBounds = true
        }
    }

}
