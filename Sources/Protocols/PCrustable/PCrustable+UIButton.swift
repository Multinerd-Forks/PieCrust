//
//  PCrustable+UIButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UIButton
public extension PCrustable where Self: UIButton {

    /// Preferred height for autolayout _(default is 40.0 for small screens and 48.0 for other screen sizes)_.
    /// Override this value by setting _preferredHeight_ in `PCConstants` to change it app-wide, or just here to set it for this button only.
    public var preferredHeight: CGFloat {
        return PCConstants.preferredHeight
    }

    /// Creates and returns a new UIButton with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - type: The button type.
    ///   - title: The button title for normal state _(default is nil)_.
    ///   - titleFont: The button title label's font _(default is nil)_.
    ///   - image: The button image for normal state _(defaul is nil)_.
    ///   - contentEdgeInsets: The button's content edge insets _(defaul is top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)_.
    ///   - isEnabled: The enabled state to use when drawing the button _(default is true)_.
    ///   - backgroundColor: The button background color _(defaul is PCColor.white)_.
    ///   - tintColor: The button tint color _(defaul is nil)_.
    ///   - alpha: The button's alpha _(default is 1.0)_.
    public init(
        type: UIButtonType,
        title: String? = nil,
        titleFont: UIFont? = nil,
        image: UIImage? = nil,
        contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0),
        isEnabled: Bool = true,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init(type: type)

        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        if let font = titleFont {
            titleLabel?.font = font
        }
        self.contentEdgeInsets = contentEdgeInsets
        self.isEnabled = isEnabled

        self.backgroundColor = backgroundColor
        if let color = tintColor {
            self.tintColor = color
        }
        self.alpha = alpha
    }

}

// MARK: - PCLoadingButton
extension PCrustable where Self: PCLoadingButton {

    /// Create button and set its properties in one line.
    ///
    /// - Parameters:
    ///   - type: The button type _(default is .custom)_.
    ///   - title: The button title for normal state.
    ///   - image: The button image for normal state _(defaul is nil)_.
    ///   - contentEdgeInsets: The button's content edge insets _(defaul is top: 0.0, left: 40.0, bottom: 0.0, right: 40.0)_.
    ///   - isEnabled: The enabled state to use when drawing the button _(default is true)_.
    ///   - backgroundColor: The button background color _(defaul is PCColor.white)_.
    ///   - tintColor: The button tint color _(defaul is nil)_.
    ///   - activityIndicatorTintColor: The button's activitiy indicator's tint color _(defaul is nil)_.
    ///   - alpha: The button's alpha _(default is 1.0)_.
    public init(
        type: UIButtonType = .custom,
        title: String?,
        titleFont: UIFont? = nil,
        image: UIImage? = nil,
        contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 40.0, bottom: 0.0, right: 40.0),
        isEnabled: Bool = true,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        activityIndicatorTintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init(type: type)

        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        if let font = titleFont {
            titleLabel?.font = font
        }
        self.contentEdgeInsets = contentEdgeInsets
        self.isEnabled = isEnabled

        self.backgroundColor = backgroundColor
        if let color = tintColor {
            self.tintColor = color
        }
        if let color = activityIndicatorTintColor {
            activityIndicator.color = color
        }
        self.alpha = alpha
    }

}
