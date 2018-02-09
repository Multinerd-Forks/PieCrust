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
	/// - phoneNumber: TextField is used to enter phone numbers.
	/// - decimal: TextField is used to enter decimal numbers.
	/// - password: TextField is used to enter passwords.
	/// - generic: TextField is used to enter generic text.
	public enum TextType {
		case emailAddress
		case phoneNumber
		case decimal
		case password
		case generic
	}
	
	/// Create text field and set its properties in one line.
	///
	/// - Parameters:
	///   - placeholder: text field placeholder text (default is "").
	///   - text: text field text (default is "").
	///   - textAlignment: text field text alignment (default is .natural).
	///   - textType: text field text type (default is .generic).
	///   - backgroundColor: text field background color (default is .white).
	///   - textColor: text field text color (default is .black).
	///   - font: text field font (default is system font).
	public convenience init(placeholder: String? = "",
							text: String = "",
							textAlignment: NSTextAlignment = .natural,
							textType: TextType = .generic,
							backgroundColor: UIColor? = .white,
							textColor: UIColor = .black,
							font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)) {
		self.init()
		
		self.placeholder = placeholder
		self.text = text
		self.textAlignment = textAlignment
		self.textType = textType
		self.backgroundColor = backgroundColor
		self.textColor = textColor
		self.font = font
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		
		setViews()
		layoutViews()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setViews()
		layoutViews()
	}

	/// Use this method to set and add your custom views.
	open func setViews() {
		backgroundColor = .white
	}

	/// Use this method to layout your custom views using SnapKit.
	open func layoutViews() {}

	/// Preferred padding for autolayout (default is 20).
	open var preferredPadding: CGFloat {
		return 20.0
	}
	
	/// Preferred height for autolayout (default is 42 for small screens and 48 for other screen sizes).
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 42.0 : 48.0
	}
	
	/// Check if text field trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}
	
	/// Text field text trimming whitespaces and new lines.
	public var trimmedText: String {
		return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
	}
	
	/// Text field text as email address (if applicable).
	public var emailAddress: String? {
		let emailText = trimmedText
		guard !emailText.isEmpty else { return nil }
		
		let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		guard emailText.range(of: emailPattern, options: .regularExpression, range: nil, locale: nil) != nil else { return nil }
		return emailText
	}
	
	/// Check if text field text is a valid email address.
	public var hasValidEmail: Bool {
		return emailAddress != nil
	}
	
	/// Sets TextField for common text types.
	public var textType: TextType = .generic {
		didSet {
			isSecureTextEntry = textType == .password
			
			switch textType {
			case .emailAddress:
				keyboardType = .emailAddress
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

}
