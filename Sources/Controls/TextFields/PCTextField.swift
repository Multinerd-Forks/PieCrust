//
//  PCTextField.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCTextField.
open class PCTextField: UITextField, PCAnimatable, PCBorderable {

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
	///   - text: The text displayed by the text field. (default is nil)
	///   - attributedPlaceholder: The styled string that is displayed when there is no other text in the text field (default is nil).
	///   - attributedText: The styled text displayed by the text field (default is nil).
	///   - textAlignment: The technique to use for aligning the text (default is .natural).
	///   - textType: The text field's text type (default is .generic).
	///   - clearsOnBeginEditing: A Boolean value indicating whether the text field removes old text when editing begins (default is false).
	///   - backgroundColor: The text field's background color (default is PCColor.white).
    ///   - textColor: The color of the text (default is PCColor.black).
    ///   - textColor: The tint color of the text field (default is PCColor.black).
	///   - font: The font of the text (default is system font).
	///   - minimumFontSize: The size of the smallest permissible font with which to draw the text field’s text (default is nil).
	///   - borderStyle: The type of border drawn around the text field (default is .none).
	///   - isEnabled: The enabled state to use when drawing the label’s text. (default is true).
	///   - alpha: Text field's alpha (default is 1.0).
	public convenience init(
		placeholder: String?,
		text: String? = nil,
		attributedPlaceholder: NSAttributedString? = nil,
		attributedText: NSAttributedString? = nil,
		textAlignment: NSTextAlignment = .natural,
		textType: TextType = .generic,
		clearsOnBeginEditing: Bool = false,
		backgroundColor: UIColor? = PCColor.white,
		textColor: UIColor? = PCColor.black,
        tintColor: UIColor? = PCColor.black,
		font: UIFont? = nil,
		minimumFontSize: CGFloat? = nil,
		borderStyle: UITextBorderStyle = .none,
		isEnabled: Bool = true,
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
		self.backgroundColor = backgroundColor
		self.textColor = textColor

        if let color = tintColor {
            self.tintColor = color
        }

		if let aFont = font {
			self.font = aFont
		}

		if let aMinimumFontSize = minimumFontSize {
			self.adjustsFontSizeToFitWidth = true
			self.minimumFontSize = aMinimumFontSize
		}

		self.borderStyle = borderStyle
		self.isEnabled = isEnabled
		self.alpha = alpha
	}

    /// Initializes and returns a newly allocated text field object with the specified frame rectangle.
	override public init(frame: CGRect) {
		super.init(frame: frame)

		setViews()
		layoutViews()
	}

    /// Returns a PCTextField object initialized from data in a given unarchiver.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setViews()
		layoutViews()
	}

	/// Use this method to set and add your custom views.
	open func setViews() {
		backgroundColor = PCColor.white
	}

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

	/// Check if text field's trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}

	/// Text field's text trimming whitespaces and new lines.
	public var trimmedText: String {
        guard let aText = text, !aText.isEmpty else { return "" }
		return aText.trimmingCharacters(in: .whitespacesAndNewlines)
	}

	/// Text field text as email address (if applicable).
	public var emailAddress: String? {
		let emailText = trimmedText
		guard !emailText.isEmpty else { return nil }

		let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		guard emailText.range(of: emailPattern, options: .regularExpression, range: nil, locale: nil) != nil else { return nil }
		return emailText
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
