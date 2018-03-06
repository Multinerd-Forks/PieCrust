//
//  PCrustable+UIButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UIButton
public extension PCrustable where Self: UIButton {

    /// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
    /// Override this value by setting `preferredHeight` in `PCConstants` to change it app-wide, or just here to set it for this button only.
    public var preferredHeight: CGFloat {
        return PCConstants.preferredHeight
    }

    /// Creates and returns a new button with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - type: The button type.
    ///   - title: The button title for normal state (default is nil).
    ///   - titleFont: The button title label's font (default is nil).
    ///   - image: The button image for normal state (defaul is nil).
    ///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0.0, left: 20.0, bottom: 0.0, right: 20.0).
    ///   - isEnabled: The enabled state to use when drawing the button (default is true).
    ///   - backgroundColor: The button background color (defaul is PCColor.white).
    ///   - tintColor: The button tint color (defaul is nil).
    ///   - alpha: The button's alpha (default is 1.0).
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
    ///   - type: The button type (default is .custom).
    ///   - title: The button title for normal state.
    ///   - image: The button image for normal state (defaul is nil).
    ///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0.0, left: 40.0, bottom: 0.0, right: 40.0).
    ///   - isEnabled: The enabled state to use when drawing the button (default is true).
    ///   - backgroundColor: The button background color (defaul is PCColor.white).
    ///   - tintColor: The button tint color (defaul is nil).
    ///   - activityIndicatorTintColor: The button's activitiy indicator's tint color (defaul is nil).
    ///   - alpha: The button's alpha (default is 1.0).
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
