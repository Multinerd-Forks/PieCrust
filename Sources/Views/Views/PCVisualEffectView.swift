//
//  PCVisualEffectView.swift
//  PieCrust
//
//  Created by Omar Albeik on 22.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCVisualEffectView.
///
/// - Conforms to:
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCVisualEffectView: UIVisualEffectView, PCAnimatable, PCBorderable, PCShadowable {

    /// Preferred padding for autolayout (default is 20).
    open var preferredPadding: CGFloat {
        return 20.0
    }

}
