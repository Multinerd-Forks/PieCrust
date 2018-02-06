//
//  TextField.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class TextField: UITextField, Shakeable, Borderable, Fadeable {

	/// TextField text type.
	///
	/// - emailAddress: TextField is used to enter email addresses.
	/// - password: TextField is used to enter passwords.
	/// - generic: TextField is used to enter generic text.
	public enum TextType {
		case emailAddress
		case phoneNumber
		case decimal
		case password
		case generic
	}
	
	public convenience init(placeholder: String? = "", textAlignment: NSTextAlignment = .center, backgroundColor: UIColor? = .white, textType: TextType = .generic) {
		self.init()
		
		self.placeholder = placeholder
		self.textAlignment = textAlignment
		self.backgroundColor = backgroundColor
		self.textType = textType
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
	
	open func setViews() {
		backgroundColor = .white
		textType = .generic
	}
	
	open func layoutViews() {}
	
	open var preferredPadding: CGFloat {
		return 20
	}
	
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 42 : 48
	}
	
	public var isEmpty: Bool {
		guard let aText = text else { return true }
		return aText.isEmpty
	}
	
	public var trimmedText: String {
		guard let aText = text else { return "" }
		return aText.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	public var emailAddress: String? {
		let emailText = trimmedText
		guard !emailText.isEmpty else { return nil }
		
		let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		guard emailText.range(of: emailPattern, options: .regularExpression, range: nil, locale: nil) != nil else { return nil }
		return emailText
	}
	
	public var hasValidEmail: Bool {
		return emailAddress != nil
	}
	
	/// Set TextField for common text types.
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
