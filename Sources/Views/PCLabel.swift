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

	/// Create label and set its properties in one line.
	///
	/// - Parameters:
	///   - text: label text (default is "").
	///   - textAlignment: label text alignment (default is .natural).
	///   - numberOfLines: number of lines (default is 1).
	///   - backgroundColor: label background color (default is .white).
	///   - textColor: label text color (defaul is .black).
	///   - font: label font (defaul is system font).
	public convenience init (text: String? = "",
							 textAlignment: NSTextAlignment = .natural,
							 numberOfLines: Int = 1,
							 backgroundColor: UIColor = .white,
							 textColor: UIColor = .black,
							 font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)) {
		self.init()
		
		self.text = text
		self.textAlignment = textAlignment
		self.numberOfLines = numberOfLines
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
