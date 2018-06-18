//
//  PCButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCButton.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCButton: UIButton, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UIButton.
public extension Crustable where Self: UIButton {

	/// Creates and returns a new UIButton with setting its properties in one line.
	///
	/// - Parameters:
	///   - type: The button type.
	///   - title: The button title _(default is nil)_.
	///   - image: The button image _(default is nil)_.
	///   - titleFont: The button title label's font _(default is nil)_.
	///   - contentEdgeInsets: The button's content edge insets _(defaul is top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)_.
	///   - isEnabled: The enabled state to use when drawing the button _(default is true)_.
	///   - backgroundColor: The button background color _(defaul is PCColor.white)_.
	///   - tintColor: The button tint color _(defaul is nil)_.
	///   - alpha: The button's alpha _(default is 1.0)_.
	public init(
		type: UIButtonType,
		title: TextType? = nil,
		image: UIImage? = nil,
		titleFont: UIFont? = nil,
		contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0),
		isEnabled: Bool = true,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil) {

		self.init(type: type)

		if let aTitle = title {
			switch aTitle {
			case .plain(let string):
				setTitle(string, for: .normal)
			case .attributed(let string):
				setAttributedTitle(string, for: .normal)
			}
		}

		setImage(image, for: .normal)

		if let font = titleFont {
			titleLabel?.font = font
		}

		self.contentEdgeInsets = contentEdgeInsets
		self.isEnabled = isEnabled

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
	}

	/// Preferred height for autolayout _(default is 45.0)_.
	public var preferredHeight: CGFloat {
		return 45.0
	}

}
