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
	///   - type: button type (default is .custom).
	///   - title: button title (defaul is nil).
	///   - backgroundColor: button background color (defaul is .white).
	///   - tintColor: button tint color (defaul is .black).
	///   - contentEdgeInsets: button content edge insets (defaul is top: 0, left: 20, bottom: 0, right: 20).
	public convenience init(
		type: UIButtonType = .custom,
		title: String? = nil,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = .black,
		contentEdgeInsets: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)) {

		self.init(type: type)

		self.setTitle(title, for: .normal)
		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}

		self.contentEdgeInsets = contentEdgeInsets
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
		return 20
	}

	/// Preferred height for autolayout (default is 42 for small screens and 48 for other screen sizes).
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 42 : 48
	}

}
