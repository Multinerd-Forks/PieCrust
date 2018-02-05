//
//  TextField.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class TextField: UITextField, Shakeable, Borderable {

	public convenience init(placeholder: String? = "", textAlignment: NSTextAlignment = .center, backgroundColor: UIColor? = .white) {
		self.init()
		
		self.placeholder = placeholder
		self.textAlignment = textAlignment
		self.backgroundColor = backgroundColor
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
	}
	
	open func layoutViews() {}
	
	open var preferredPadding: CGFloat {
		return 20
	}
	
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 42 : 48
	}

}

// MARK: - Helpers
public extension TextField {
	
	public var trimmedText: String? {
		return text?.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	public var emailAddress: String? {
		guard let emailText = trimmedText else { return nil }
		
		let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		guard emailText.range(of: emailPattern, options: .regularExpression, range: nil, locale: nil) != nil else { return nil }
		return emailText
	}
	
}
