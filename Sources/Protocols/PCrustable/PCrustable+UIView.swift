//
//  PCrustable+UIView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UIView
public extension PCrustable where Self: UIView {

    /// Preferred padding for autolayout _(default is 20.0)_.
    /// Override this value by setting _preferredPadding_ in `PCConstants` to change it app-wide, or just here to set it for this view only.
    public var preferredPadding: CGFloat {
        return PCConstants.preferredPadding
    }

    /// Creates and returns a new UIView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - backgroundColor: Background color of the view _(default is PCColor.white)_.
    ///   - tintColor: Text color of the view _(default is nil)_.
    ///   - alpha: Alpha of the view _(default is 1.0)_.
    public init(
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init()

        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.alpha = alpha
    }

}
