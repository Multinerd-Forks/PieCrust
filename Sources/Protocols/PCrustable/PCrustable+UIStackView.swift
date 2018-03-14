//
//  PCrustable+UIStackView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

public extension PCrustable where Self: UIStackView {

    /// Creates and returns a new UIStackView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - arrangedSubviews: Initial arrangedSubviews array _(default is [])_.
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis _(default is .fill)_.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis _(default is .fill)_.
    ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views _(default is 0.0)_.
    ///   - backgroundColor: Background color of the stack view _(default is PCColor.white)_.
    ///   - tintColor: Text color of the stack view _(default is nil)_.
    ///   - alpha: Stack view's alpha _(default is 1.0)_.
    public init(
        arrangedSubviews: [UIView] = [],
        axis: UILayoutConstraintAxis,
        alignment: UIStackViewAlignment = .fill,
        distribution: UIStackViewDistribution = .fill,
        spacing: CGFloat = 0.0,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init(arrangedSubviews: arrangedSubviews)

        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing

        self.backgroundColor = backgroundColor
        if let color = tintColor {
            self.tintColor = color
        }
        self.alpha = alpha
    }

}
