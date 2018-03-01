//
//  PCButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCButton.
///
/// - Conforms to:
///   - PCLayoutable
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCButton: UIButton, PCLayoutable, PCAnimatable, PCBorderable, PCShadowable {

    /// Creates and returns a new button with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - type: The button type.
    ///   - title: The button title for normal state (default is nil).
    ///   - titleFont: The button title label's font (default is nil).
    ///   - image: The button image for normal state (defaul is nil).
    ///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0.0, left: 20.0, bottom: 0.0, right: 20.0).
    ///   - backgroundColor: The button background color (defaul is PCColor.white).
    ///   - tintColor: The button tint color (defaul is nil).
    ///   - isEnabled: The enabled state to use when drawing the button (default is true).
    ///   - alpha: The button's alpha (default is 1.0).
    public convenience init(
        type: UIButtonType,
        title: String? = nil,
        titleFont: UIFont? = nil,
        image: UIImage? = nil,
        contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0),
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        isEnabled: Bool = true,
        alpha: CGFloat = 1.0) {

        self.init(type: type)

        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)

        if let font = titleFont {
            titleLabel?.font = font
        }

        self.contentEdgeInsets = contentEdgeInsets
        
        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.isEnabled = isEnabled
        self.alpha = alpha
    }

    /// Initializes and returns a newly allocated view object with the specified frame rectangle.	///
    /// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
    override public init(frame: CGRect) {
        super.init(frame: frame)

        setViews()
        layoutViews()
    }

    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameter aDecoder: An unarchiver object.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setViews()
        layoutViews()
    }

    /// Use this method to set and add your custom views.
    open func setViews() {}

    /// Use this method to layout your custom views using SnapKit.
    open func layoutViews() {}

    /// Preferred padding for autolayout (default is 20).
    open var preferredPadding: CGFloat {
        return 20.0
    }

    /// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
    open var preferredHeight: CGFloat {
        return UIScreen.main.isSmall ? 40.0 : 48.0
    }

}
