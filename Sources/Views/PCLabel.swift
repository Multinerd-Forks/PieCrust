//
//  PCLabel.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCLabel.
open class PCLabel: UILabel, PCAnimatable, PCBorderable {

	///
	/// - Parameters:
	///   - text: label text (default is "").
	///   - textAlignment: label text alignment (default is .natural).
	///   - numberOfLines: number of lines (default is 1).
	///   - backgroundColor: label background color (default is .white).
	///   - textColor: label text color (defaul is .black).
	///   - font: label font (defaul is system font).


	/// Create label and set its properties in one line.
	///
	/// - Parameters:
	///   - text: label text (default is "").
	///   - attributedText: label attributed text (default is nil).
	///   - textAlignment: label text alignment (default is .natural).
	///   - numberOfLines: number of lines (default is 1).
	///   - backgroundColor: label background color (default is .white).
	///   - textColor: label text color (defaul is .black).
	///   - alpha: alpha (default is 1.0).
	///   - font: label font (defaul is system font).
	///   - minimumScaleFactor: minimum text scale factor (default is 1).
	public convenience init (
		text: String? = "",
		attributedText: NSAttributedString? = nil,
		textAlignment: NSTextAlignment = .natural,
		numberOfLines: Int = 1,
		backgroundColor: UIColor = .white,
		textColor: UIColor = .black,
		alpha: CGFloat = 1.0,
		font: UIFont? = nil,
		minimumScaleFactor: CGFloat = 1.0) {

		self.init()

		self.text = text
		self.attributedText = attributedText
		self.textAlignment = textAlignment
		self.numberOfLines = numberOfLines
		self.backgroundColor = backgroundColor
		self.textColor = textColor
		self.alpha = alpha

		if let aFont = font {
			self.font = aFont
		}

		if minimumScaleFactor < 1 {
			self.adjustsFontSizeToFitWidth = true
			self.minimumScaleFactor = minimumScaleFactor
		}
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
	open func setViews() {}

	/// Use this method to layout your custom views using SnapKit.
	open func layoutViews() {}

	/// Preferred padding for autolayout (default is 20).
	open var preferredPadding: CGFloat {
		return 20.0
	}

	/// Check if label trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}

	/// Label text trimming whitespaces and new lines.
	public var trimmedText: String {
		return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
	}

}
