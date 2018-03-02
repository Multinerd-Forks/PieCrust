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

    /// Create PCVisualEffectView and set its properties in one line.
    ///
    /// - Parameters:
    ///   - effect: The UIVisualEffect you provide for the view. This can be a UIBlurEffect or a UIVibrancyEffect.
    ///   - alpha: Alpha of the visual view (default is 1.0).
    public convenience init(effect: UIVisualEffect?, alpha: CGFloat = 1.0) {
        self.init(effect: effect)

        self.alpha = alpha
    }

    /// Preferred padding for autolayout (default is 20).
    /// Override this value by setting `preferredPadding` in `PCConstants` to change it app-wide, or just here to set it for this view only.
    open var preferredPadding: CGFloat {
        return PCConstants.preferredPadding
    }

}
