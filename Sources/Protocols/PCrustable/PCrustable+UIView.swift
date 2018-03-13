//
//  PCrustable+UIView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UIView
public extension PCrustable where Self: UIView {

    /// Preferred padding for autolayout (default is 20.0).
    /// Override this value by setting `preferredPadding` in `PCConstants` to change it app-wide, or just here to set it for this view only.
    public var preferredPadding: CGFloat {
        return PCConstants.preferredPadding
    }

    /// Creates and returns a new UIView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - backgroundColor: Background color of the view (default is PCColor.white).
    ///   - tintColor: Text color of the view (default is nil).
    ///   - alpha: Alpha of the view (default is 1.0).
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
