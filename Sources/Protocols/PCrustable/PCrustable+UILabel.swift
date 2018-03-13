//
//  PCrustable+UILabel.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

public extension PCrustable where Self: UILabel {

    /// Creates and returns a new UILabel with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - text: Label's text.
    ///   - attributedText: Label's attributed text (default is nil).
    ///   - textAlignment: The technique to use for aligning the text (default is .natural).
    ///   - numberOfLines: The maximum number of lines to use for rendering text (default is 1).
    ///   - textColor: The color of the text (defaul is PCColor.black).
    ///   - font: label font (defaul is system font).
    ///   - minimumScaleFactor: The minimum scale factor supported for the label’s text (default is 1).
    ///   - lineBreakMode: The technique to use for wrapping and truncating the label’s text (default is .byTruncatingTail).
    ///   - backgroundColor: The label's background color (default is PCColor.white).
    ///   - tintColor: Text color of the view (default is nil).
    ///   - alpha: Label's alpha (default is 1.0).
    public init(
        text: String?,
        attributedText: NSAttributedString? = nil,
        textAlignment: NSTextAlignment = .natural,
        numberOfLines: Int = 1,
        textColor: UIColor? = PCColor.black,
        font: UIFont? = nil,
        minimumScaleFactor: CGFloat = 1.0,
        lineBreakMode: NSLineBreakMode = .byTruncatingTail,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init()

        self.text = text

        if let attrText = attributedText {
            self.attributedText = attrText
        }

        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.textColor = textColor

        if let aFont = font {
            self.font = aFont
        }

        if minimumScaleFactor < 1 {
            self.adjustsFontSizeToFitWidth = true
            self.minimumScaleFactor = minimumScaleFactor
        }

        self.lineBreakMode = lineBreakMode

        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.alpha = alpha
    }

    /// Check if label's trimmed text is empty.
    public var isEmpty: Bool {
        return trimmedText.isEmpty
    }

    /// Label's text trimming whitespaces and new lines.
    public var trimmedText: String {
        return text?.trimmed ?? ""
    }

}
