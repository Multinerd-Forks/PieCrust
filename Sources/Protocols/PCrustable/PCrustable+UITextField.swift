//
//  PCrustable+UITextField.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UITextField
public extension PCrustable where Self: UITextField {

    /// Preferred height for autolayout _(default is 40.0 for iPhone SE screen sizes and 48.0 for others)_.
    /// Override this value by setting _preferredHeight_ in `PCConstants` to change it app-wide, or just here to set it for this text field only.
    public var preferredHeight: CGFloat {
        return PCConstants.preferredHeight
    }

    /// Creates and returns a new UITextField with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - placeholder: The string that is displayed when there is no other text in the text field.
    ///   - text: The text displayed by the text field _(default is nil)_
    ///   - attributedPlaceholder: The styled string that is displayed when there is no other text in the text field _(default is nil)_.
    ///   - attributedText: The styled text displayed by the text field _(default is nil)_.
    ///   - textAlignment: The technique to use for aligning the text _(default is .natural)_.
    ///   - textType: The text field's text type _(default is .generic)_.
    ///   - clearsOnBeginEditing: A Boolean value indicating whether the text field removes old text when editing begins _(default is false)_.
    ///   - textColor: The color of the text _(default is PCColor.black)_.
    ///   - font: The font of the text _(default is system font)_.
    ///   - minimumFontSize: The size of the smallest permissible font with which to draw the text field’s text _(default is nil)_.
    ///   - borderStyle: The type of border drawn around the text field _(default is .none)_.
    ///   - keyboardAppearance: The appearance style of the keyboard that is associated with the text object _(default is .default)_.
    ///   - isEnabled: The enabled state to use when drawing the text field _(default is true)_.
    ///   - backgroundColor: The text field's background color _(default is PCColor.white)_.
    ///   - tintColor: The tint color of the text field _(default is nil)_.
    ///   - alpha: Text field's alpha _(default is 1.0)_.
    public init(
        placeholder: String?,
        text: String? = nil,
        attributedPlaceholder: NSAttributedString? = nil,
        attributedText: NSAttributedString? = nil,
        textAlignment: NSTextAlignment = .natural,
        textType: PCTextFieldType = .generic,
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
        self.setTextType(textType)
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

    public func setTextType(_ type: PCTextFieldType) {
        isSecureTextEntry = (type == .password)

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

    /// Check if text field's trimmed text is empty.
    public var isEmpty: Bool {
        return trimmedText.isEmpty
    }

    /// Text field's text trimming whitespaces and new lines.
    public var trimmedText: String {
        return text?.trimmed ?? ""
    }

    /// Text field text as email address _(if applicable)_.
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

}
