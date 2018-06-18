//
//  PCLabel.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCLabel.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCLabel: UILabel, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UILabel.
public extension Crustable where Self: UILabel {

	/// Creates and returns a new UILabel with setting its properties in one line.
	///
	/// - Parameters:
	///   - text: Label's text.
	///   - textAlignment: The technique to use for aligning the text _(default is .natural)_.
	///   - numberOfLines: The maximum number of lines to use for rendering text _(default is 1)_.
	///   - textColor: The color of the text _(defaul is .black)_.
	///   - font: Label font _(defaul is system font)_.
	///   - minimumScaleFactor: The minimum scale factor supported for the label’s text _(default is 1.0)_.
	///   - lineBreakMode: The technique to use for wrapping and truncating the label’s text _(default is .byTruncatingTail)_.
	///   - backgroundColor: The label's background color _(default is .white)_.
	///   - tintColor: Tint color of the label _(default is nil)_.
	public init(
		text: TextType,
		textAlignment: NSTextAlignment = .natural,
		numberOfLines: Int = 1,
		textColor: UIColor? = .black,
		font: UIFont? = nil,
		minimumScaleFactor: CGFloat = 1.0,
		lineBreakMode: NSLineBreakMode = .byTruncatingTail,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init()

		switch text {
		case .plain(let string):
			self.text = string
		case .attributed(let attributedText):
			self.attributedText = attributedText
		}

		self.textAlignment = textAlignment
		self.numberOfLines = numberOfLines
		self.textColor = textColor

		if let aFont = font {
			self.font = aFont
		}

		if minimumScaleFactor < 1 {
			self.adjustsFontSizeToFitWidth = true
			self.minimumScaleFactor = minimumScaleFactor
		}

		self.lineBreakMode = lineBreakMode
		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}
	}

	/// Check if label's trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}

	/// Label's text trimming whitespaces and new lines.
	public var trimmedText: String {
		return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
	}

}
