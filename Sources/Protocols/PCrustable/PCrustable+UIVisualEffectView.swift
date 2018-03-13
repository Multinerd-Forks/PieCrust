//
//  PCrustable+UIVisualEffectView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

public extension PCrustable where Self: UIVisualEffectView {

    /// Creates and returns a new UIVisualEffectView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - effect: The UIVisualEffect you provide for the view. This can be a UIBlurEffect or a UIVibrancyEffect.
    ///   - alpha: Alpha of the visual view (default is 1.0).
    public init(effect: UIVisualEffect?, alpha: CGFloat = 1.0) {
        self.init(effect: effect)

        self.alpha = alpha
    }

}
