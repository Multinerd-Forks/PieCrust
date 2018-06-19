//
//  PCTextView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTextView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCTextView: UITextView, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UITextView.
public extension Crustable where Self: UITextView {

	/// Creates and returns a new UITextView with setting its properties in one line.
	///
	/// - Parameters:
	///   - text: The text displayed by the text view.
	///   - font: The font of the text _(default is system font)_.
	///   - textColor: The color of the text _(default is .black)_.
	///   - isEditable: A Boolean value indicating whether the receiver is editable _(default is true)_.
	///   - allowsEditingTextAttributes: A Boolean value indicating whether the text view allows the user to edit style information _(default is false)_.
	///   - textAlignment: The technique to use for aligning the text _(default is .natural)_.
	///   - textContainerInset: The inset of the text container's layout area within the text view's content area _(default is .zero)_.
	///   - backgroundColor: The text-view's background color _(default is .white)_.
	///   - tintColor: Text color of the view _(default is nil)_.
	public init(
		text: TextType,
		font: UIFont? = nil,
		textColor: UIColor? = .black,
		isEditable: Bool = true,
		allowsEditingTextAttributes: Bool = false,
		textAlignment: NSTextAlignment = .natural,
		textContainerInset: UIEdgeInsets = .zero,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init()

		switch text {
		case .plain(let string):
			self.text = string
		case .attributed(let string):
			self.attributedText = string
		case .empty:
			self.attributedText = nil
			self.text = nil
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
	}

}
