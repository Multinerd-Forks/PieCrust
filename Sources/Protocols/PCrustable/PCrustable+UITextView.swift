//
//  PCrustable+UITextView.swift
//  PieCrust
//
//  Created by Omar Albeik on 13.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

public extension PCrustable where Self: UITextView {

    /// Creates and returns a new UITextView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - text: The text displayed by the text view.
    ///   - attributedText: The styled text displayed by the text view (default is nil).
    ///   - font: The font of the text (default is system font).
    ///   - textColor: The color of the text (default is PCColor.black).
    ///   - isEditable: A Boolean value indicating whether the receiver is editable (default is true).
    ///   - allowsEditingTextAttributes: A Boolean value indicating whether the text view allows the user to edit style information (default is false).
    ///   - textAlignment: The technique to use for aligning the text (default is .natural).
    ///   - textContainerInset: The inset of the text container's layout area within the text view's content area (default is UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)).
    ///   - backgroundColor: The text-view's background color (default is PCColor.white).
    ///   - tintColor: Text color of the view (default is nil).
    ///   - alpha: Text-view's alpha (default is 1.0).
    public init(
        text: String,
        attributedText: NSAttributedString? = nil,
        font: UIFont? = nil,
        textColor: UIColor? = PCColor.black,
        isEditable: Bool = true,
        allowsEditingTextAttributes: Bool = false,
        textAlignment: NSTextAlignment = .natural,
        textContainerInset: UIEdgeInsets = .init(top: 8, left: 0, bottom: 8, right: 0),
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init()

        self.text = text

        if let attrText = attributedText {
            self.attributedText = attrText
        }

        if let aFont = font {
            self.font = aFont
        }

        self.textColor = textColor
        self.isEditable = isEditable
        self.allowsEditingTextAttributes = allowsEditingTextAttributes
        self.textAlignment = textAlignment
        self.textContainerInset = textContainerInset

        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.alpha = alpha
    }
    
}
