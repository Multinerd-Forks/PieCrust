//
//  PCPillTextField.swift
//  PieCrust
//
//  Created by Omar Albeik on 22.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCPillTextField.
open class PCPillTextField: PCTextField {

    /// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
    override open var bounds: CGRect {
        didSet {
            cornerRadius = bounds.height / 2
        }
    }

}
