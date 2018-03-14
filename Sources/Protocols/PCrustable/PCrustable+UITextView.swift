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
    ///   - attributedText: The styled text displayed by the text view _(default is nil)_.
    ///   - font: The font of the text _(default is system font)_.
    ///   - textColor: The color of the text _(default is PCColor.black)_.
    ///   - isEditable: A Boolean value indicating whether the receiver is editable _(default is true)_.
    ///   - allowsEditingTextAttributes: A Boolean value indicating whether the text view allows the user to edit style information _(default is false)_.
    ///   - textAlignment: The technique to use for aligning the text _(default is .natural)_.
    ///   - textContainerInset: The inset of the text container's layout area within the text view's content area _(default is top: 8, left: 0, bottom: 8, right: 0)_.
    ///   - backgroundColor: The text-view's background color _(default is PCColor.white)_.
    ///   - tintColor: Text color of the view _(default is nil)_.
    ///   - alpha: Text-view's alpha _(default is 1.0)_.
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
