//
//  PCTextField.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTextField.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCTextField: UITextField, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UITextField.
public extension Crustable where Self: UITextField {

	/// Creates and returns a new UITextField with setting its properties in one line.
	///
	/// - Parameters:
	///   - placeholder: The string that is displayed when there is no other text in the text field.
	///   - text: The text displayed by the text field _(default is nil)_
	///   - textAlignment: The technique to use for aligning the text _(default is .natural)_.
	///   - textType: The text field's text type _(default is .generic)_.
	///   - textColor: The color of the text _(default is .black)_.
	///   - font: The font of the text _(default is nil)_.
	///   - borderStyle: The type of border drawn around the text field _(default is .none)_.
	///   - backgroundColor: The text field's background color _(default is .white)_.
	///   - tintColor: The tint color of the text field _(default is nil)_.
	public init(
		placeholder: TextType?,
		text: TextType? = nil,
		textAlignment: NSTextAlignment = .natural,
		textType: TextFieldType = .generic,
		textColor: UIColor? = .black,
		font: UIFont? = nil,
		borderStyle: UITextBorderStyle = .none,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init()

		if let aPlaceholder = placeholder {
			switch aPlaceholder {
			case .plain(let string):
				self.placeholder = string
			case .attributed(let string):
				self.attributedPlaceholder = string
			}
		}

		if let aText = text {
			switch aText {
			case .plain(let string):
				self.text = string
			case .attributed(let string):
				self.attributedText = string
			}
		}

		self.textAlignment = textAlignment
		self.setTextType(textType)
		self.textColor = textColor

		if let aFont = font {
			self.font = aFont
		}

		self.borderStyle = borderStyle

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
	}

	// swiftlint:disable cyclomatic_complexity

	/// Set text field's text type.
	///
	/// - Parameter type: text type.
	public func setTextType(_ type: TextFieldType) {
		isSecureTextEntry = (type == .password)

		switch type {
		case .emailAddress:
			keyboardType = .emailAddress
			autocorrectionType = .no
			autocapitalizationType = .none

			if #available(iOS 10.0, *) {
				textContentType = .emailAddress
			}

		case .url:
			keyboardType = .URL
			autocorrectionType = .no
			autocapitalizationType = .none

			if #available(iOS 10.0, *) {
				textContentType = .URL
			}

		case .phoneNumber:
			if #available(iOS 10.0, *) {
				keyboardType = .asciiCapableNumberPad
			} else {
				keyboardType = .numberPad
			}

			if #available(iOS 10.0, *) {
				textContentType = .telephoneNumber
			}

		case .decimal:
			keyboardType = .decimalPad

		case .password:
			keyboardType = .asciiCapable
			autocorrectionType = .no
			autocapitalizationType = .none

			if #available(iOS 11.0, *) {
				textContentType = .password
			}

		case .generic:
			keyboardType = .asciiCapable
			autocorrectionType = .default
			autocapitalizationType = .sentences
		}
	}

	// swiftlint:enable cyclomatic_complexity

	/// Preferred height for autolayout _(default is 45.0)_.
	public var preferredHeight: CGFloat {
		return 45.0
	}

	/// Text field text as email address _(if applicable)_.
	public var emailAddress: String? {
		let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		guard trimmedText.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil else { return nil }
		return trimmedText
	}

	/// Check if text field's text is a valid email address.
	public var hasValidEmail: Bool {
		return emailAddress != nil
	}

	/// text field's text trimming whitespaces and new lines.
	public var trimmedText: String {
		return text!.trimmingCharacters(in: .whitespacesAndNewlines)
	}

}
