//
//  PCLabel.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

/// PCLabel.
///
/// - Conforms to:
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCLabel: UILabel, PCAnimatable, PCBorderable, PCShadowable {

    /// Create label and set its properties in one line.
	///
	/// - Parameters:
	///   - text: Label's text.
	///   - attributedText: Label's attributed text (default is nil).
	///   - textAlignment: The technique to use for aligning the text (default is .natural).
	///   - numberOfLines: The maximum number of lines to use for rendering text (default is 1).
    ///   - backgroundColor: The label's background color (default is PCColor.white).
    ///   - textColor: The color of the text (defaul is PCColor.black).
    ///   - font: label font (defaul is system font).
    ///   - minimumScaleFactor: The minimum scale factor supported for the label’s text (default is 1).
    ///   - lineBreakMode: The technique to use for wrapping and truncating the label’s text (default is .byTruncatingTail).
    ///   - alpha: Label's alpha (default is 1.0).
	public convenience init(
		text: String?,
		attributedText: NSAttributedString? = nil,
		textAlignment: NSTextAlignment = .natural,
		numberOfLines: Int = 1,
        backgroundColor: UIColor? = PCColor.white,
        textColor: UIColor? = PCColor.black,
        font: UIFont? = nil,
        minimumScaleFactor: CGFloat = 1.0,
        lineBreakMode: NSLineBreakMode = .byTruncatingTail,
        alpha: CGFloat = 1.0) {
		self.init()
		self.text = text

		if let attrText = attributedText {
			self.attributedText = attrText
		}
		
		self.textAlignment = textAlignment
		self.numberOfLines = numberOfLines
		self.backgroundColor = backgroundColor
		self.textColor = textColor

		if let aFont = font {
			self.font = aFont
		}

		if minimumScaleFactor < 1 {
			self.adjustsFontSizeToFitWidth = true
			self.minimumScaleFactor = minimumScaleFactor
		}

        self.lineBreakMode = lineBreakMode
        self.alpha = alpha
	}

	/// Check if label's trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}

	/// Label's text trimming whitespaces and new lines.
	public var trimmedText: String {
		return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
	}

}
