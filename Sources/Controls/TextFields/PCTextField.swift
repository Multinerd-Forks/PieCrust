//
//  PCTextField.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCTextField.
///
/// - Conforms to:
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCTextField: UITextField, PCAnimatable, PCBorderable, PCShadowable {

	/// TextField text type.
	///
	/// - emailAddress: TextField is used to enter email addresses.
	/// - emailAddress: TextField is used to enter URLs.
	/// - phoneNumber: TextField is used to enter phone numbers.
	/// - decimal: TextField is used to enter decimal numbers.
	/// - password: TextField is used to enter passwords.
	/// - generic: TextField is used to enter generic text.
	public enum TextType {
		case emailAddress
		case url
		case phoneNumber
		case decimal
		case password
		case generic
	}

	/// Create text field and set its properties in one line.
	///
	/// - Parameters:
	///   - placeholder: The string that is displayed when there is no other text in the text field.
	///   - text: The text displayed by the text field (default is nil)
	///   - attributedPlaceholder: The styled string that is displayed when there is no other text in the text field (default is nil).
	///   - attributedText: The styled text displayed by the text field (default is nil).
	///   - textAlignment: The technique to use for aligning the text (default is .natural).
	///   - textType: The text field's text type (default is .generic).
	///   - clearsOnBeginEditing: A Boolean value indicating whether the text field removes old text when editing begins (default is false).
    ///   - textColor: The color of the text (default is PCColor.black).
    ///   - font: The font of the text (default is system font).
    ///   - minimumFontSize: The size of the smallest permissible font with which to draw the text field’s text (default is nil).
    ///   - borderStyle: The type of border drawn around the text field (default is .none).
    ///   - keyboardAppearance: The appearance style of the keyboard that is associated with the text object (default is .default).
    ///   - isEnabled: The enabled state to use when drawing the text field (default is true).
    ///   - backgroundColor: The text field's background color (default is PCColor.white).
    ///   - tintColor: The tint color of the text field (default is nil).
	///   - alpha: Text field's alpha (default is 1.0).
	public convenience init(
		placeholder: String?,
		text: String? = nil,
		attributedPlaceholder: NSAttributedString? = nil,
		attributedText: NSAttributedString? = nil,
		textAlignment: NSTextAlignment = .natural,
		textType: TextType = .generic,
		clearsOnBeginEditing: Bool = false,
        textColor: UIColor? = PCColor.black,
        font: UIFont? = nil,
        minimumFontSize: CGFloat? = nil,
        borderStyle: UITextBorderStyle = .none,
        keyboardAppearance: UIKeyboardAppearance = .default,
        isEnabled: Bool = true,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
		alpha: CGFloat = 1.0) {

		self.init()

		self.placeholder = placeholder
		self.text = text
        if let attrPlaceholder = attributedPlaceholder {
            self.attributedPlaceholder = attrPlaceholder
        }
        if let attrText = attributedText {
            self.attributedText = attrText
        }
		self.textAlignment = textAlignment
		self.textType = textType
        self.update(forTextType: textType)
		self.clearsOnBeginEditing = clearsOnBeginEditing
        self.textColor = textColor
		if let aFont = font {
			self.font = aFont
		}
		if let aMinimumFontSize = minimumFontSize {
			self.adjustsFontSizeToFitWidth = true
			self.minimumFontSize = aMinimumFontSize
		}
        self.keyboardAppearance = keyboardAppearance
		self.borderStyle = borderStyle
        self.isEnabled = isEnabled

        self.backgroundColor = backgroundColor
        if let color = tintColor {
            self.tintColor = color
        }
		self.alpha = alpha
	}

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
    /// Override this value by setting `preferredHeight` in `PCConstants` to change it app-wide, or just here to set it for this text field only.
	open var preferredHeight: CGFloat {
		return PCConstants.preferredHeight
	}

	/// Check if text field's trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}

	/// Text field's text trimming whitespaces and new lines.
	public var trimmedText: String {
        return text?.trimmed ?? ""
	}

	/// Text field text as email address (if applicable).
	public var emailAddress: String? {
        guard trimmedText.isEmail else { return nil }
		return trimmedText
	}

	/// Check if text field's text is a valid email address.
	public var hasValidEmail: Bool {
		return emailAddress != nil
	}

    /// Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    public func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        self.attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }

	/// Sets TextField for common text types.
	public var textType: TextType = .generic {
		didSet {
            update(forTextType: textType)
		}
	}

    private func update(forTextType type: TextType) {
        isSecureTextEntry = (textType == .password)

        switch type {
        case .emailAddress:
            keyboardType = .emailAddress
            autocorrectionType = .no
            autocapitalizationType = .none

        case .url:
            keyboardType = .URL
            autocorrectionType = .no
            autocapitalizationType = .none

        case .phoneNumber:
            if #available(iOS 10.0, *) {
                keyboardType = .asciiCapableNumberPad
            } else {
                keyboardType = .numberPad
            }

        case .decimal:
            keyboardType = .decimalPad

        case .password:
            keyboardType = .asciiCapable
            autocorrectionType = .no
            autocapitalizationType = .none

        case .generic:
            keyboardType = .asciiCapable
            autocorrectionType = .default
            autocapitalizationType = .sentences
        }
    }

}
