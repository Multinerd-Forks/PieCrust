//
//  PCButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

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
	///   - type: The button type (default is .custom).
    ///   - title: The button title for normal state.
    ///   - titleFont: The button title label's font (default is nil).
    ///   - image: The button image for normal state (defaul is nil).
	///   - backgroundColor: The button background color (defaul is PCColor.white).
	///   - tintColor: The button tint color (defaul is PCColor.black).
	///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0, left: 20, bottom: 0, right: 20).
    ///   - alpha: The button's alpha (default is 1.0).
	public convenience init(
		type: UIButtonType = .custom,
		title: String?,
        titleFont: UIFont? = nil,
        image: UIImage? = nil,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = PCColor.black,
        contentEdgeInsets: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20),
        alpha: CGFloat = 1.0) {

		self.init(type: type)

		self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)

        if let font = titleFont {
            titleLabel?.font = font
        }

		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}

		self.contentEdgeInsets = contentEdgeInsets
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
		return 20
	}

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 40.0 : 48.0
	}

}
