//
//  PCButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCButton.
open class PCButton: UIButton, PCAnimatable, PCBorderable {

	/// Create button and set its properties in one line.
	///
	/// - Parameters:
	///   - type: The button type (default is .custom).
    ///   - title: The button title for normal state.
    ///   - image: The button image for normal state (defaul is nil).
	///   - backgroundColor: The button background color (defaul is PCColor.white).
	///   - tintColor: The button tint color (defaul is PCColor.black).
	///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0, left: 20, bottom: 0, right: 20).
    ///   - alpha: The button's alpha (default is 1.0).
	public convenience init(
		type: UIButtonType = .custom,
		title: String?,
        image: UIImage? = nil,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = PCColor.black,
        contentEdgeInsets: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20),
        alpha: CGFloat = 1.0) {

		self.init(type: type)

		self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}

		self.contentEdgeInsets = contentEdgeInsets
        self.alpha = alpha
	}

    /// Initializes and returns a newly allocated button object with the specified frame rectangle.
	override public init(frame: CGRect) {
		super.init(frame: frame)

		setViews()
		layoutViews()
	}

    /// Returns a PCButton object initialized from data in a given unarchiver.
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
