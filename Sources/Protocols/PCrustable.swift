//
//  PCrustable.swift
//  PieCrust
//
//  Created by Omar Albeik on 23.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// swiftlint:disable file_length

import UIKit

public protocol PCrustable: class {}

// MARK: - UINavigationController
public extension PCrustable where Self: UINavigationController {

	/// Set navigationBar background and text colors
	///
	/// - Parameters:
	///   - background: backgound color
	///   - text: text color
	public func setNavigaitonBarColors(background: UIColor, tint: UIColor) {
		navigationBar.isTranslucent = (background == .clear)
		navigationBar.backgroundColor = background
		navigationBar.barTintColor = background
		navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationBar.tintColor = tint
		navigationBar.titleTextAttributes = [.foregroundColor: tint]
		navigationBar.shadowImage = UIImage()
	}

}

// MARK: - UIViewController
public extension PCrustable where Self: UIViewController {

	/// Set tab bar item here.
	func setTabBarItem() {}

	/// Set navigation item here.
	func setNavigationItem() {}

	/// Set gesture recognizers here.
	func setGestureRecognizers() {}

	/// Set Navigation Item logo image.
	///
	/// - Parameter image: logo image.
	public func setNavigationItemLogo(_ image: UIImage) {
		let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 30.0))
		logoImageView.contentMode = .scaleAspectFit
		logoImageView.image = image
		navigationItem.titleView = logoImageView
	}

}

// MARK: - UIView
public extension PCrustable where Self: UIView {

	/// Preferred padding for autolayout (default is 20.0).
	/// Override this value by setting `preferredPadding` in `PCConstants` to change it app-wide, or just here to set it for this view only.
	var preferredPadding: CGFloat {
		return PCConstants.preferredPadding
	}

	/// Create a PCView and set its properties in one line.
	///
	/// - Parameters:
	///   - backgroundColor: Background color of the view (default is PCColor.white).
	///   - tintColor: Text color of the view (default is nil).
	///   - alpha: Alpha of the view (default is 1.0).
	public init(
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil,
		alpha: CGFloat = 1.0) {

		self.init()

		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}

		self.alpha = alpha
	}

}

// MARK: - UIButton
public extension PCrustable where Self: UIButton {

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
	/// Override this value by setting `preferredHeight` in `PCConstants` to change it app-wide, or just here to set it for this button only.
	var preferredHeight: CGFloat {
		return PCConstants.preferredHeight
	}

	/// Creates and returns a new button with setting its properties in one line.
	///
	/// - Parameters:
	///   - type: The button type.
	///   - title: The button title for normal state (default is nil).
	///   - titleFont: The button title label's font (default is nil).
	///   - image: The button image for normal state (defaul is nil).
	///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0.0, left: 20.0, bottom: 0.0, right: 20.0).
	///   - isEnabled: The enabled state to use when drawing the button (default is true).
	///   - backgroundColor: The button background color (defaul is PCColor.white).
	///   - tintColor: The button tint color (defaul is nil).
	///   - alpha: The button's alpha (default is 1.0).
	public init(
		type: UIButtonType,
		title: String? = nil,
		titleFont: UIFont? = nil,
		image: UIImage? = nil,
		contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0),
		isEnabled: Bool = true,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil,
		alpha: CGFloat = 1.0) {

		self.init(type: type)

		self.setTitle(title, for: .normal)
		self.setImage(image, for: .normal)
		if let font = titleFont {
			titleLabel?.font = font
		}
		self.contentEdgeInsets = contentEdgeInsets
		self.isEnabled = isEnabled

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
		self.alpha = alpha
	}

}

// MARK: - PCLoadingButton
extension PCrustable where Self: PCLoadingButton {

	/// Create button and set its properties in one line.
	///
	/// - Parameters:
	///   - type: The button type (default is .custom).
	///   - title: The button title for normal state.
	///   - image: The button image for normal state (defaul is nil).
	///   - contentEdgeInsets: The button's content edge insets (defaul is top: 0.0, left: 40.0, bottom: 0.0, right: 40.0).
	///   - isEnabled: The enabled state to use when drawing the button (default is true).
	///   - backgroundColor: The button background color (defaul is PCColor.white).
	///   - tintColor: The button tint color (defaul is nil).
	///   - activityIndicatorTintColor: The button's activitiy indicator's tint color (defaul is nil).
	///   - alpha: The button's alpha (default is 1.0).
	public init(
		type: UIButtonType = .custom,
		title: String?,
		titleFont: UIFont? = nil,
		image: UIImage? = nil,
		contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 40.0, bottom: 0.0, right: 40.0),
		isEnabled: Bool = true,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil,
		activityIndicatorTintColor: UIColor? = nil,
		alpha: CGFloat = 1.0) {

		self.init(type: type)

		self.setTitle(title, for: .normal)
		self.setImage(image, for: .normal)
		if let font = titleFont {
			titleLabel?.font = font
		}
		self.contentEdgeInsets = contentEdgeInsets
		self.isEnabled = isEnabled

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
		if let color = activityIndicatorTintColor {
			activityIndicator.color = color
		}
		self.alpha = alpha
	}

}

// MARK: - UITextField
public extension PCrustable where Self: UITextField {

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
	/// Override this value by setting `preferredHeight` in `PCConstants` to change it app-wide, or just here to set it for this text field only.
	var preferredHeight: CGFloat {
		return PCConstants.preferredHeight
	}

	/// Create text field and set its properties in one line.
	///
	/// - Parameters:
	///   - placeholder: The string that is displayed when there is no other text in the text field.
	///   - text: The text displayed by the text field (default is nil)
	///   - attributedPlaceholder: The styled string that is displayed when there is no other text in the text field (default is nil).
	///   - attributedText: The styled text displayed by the text field (default is nil).
	///   - textAlignment: The technique to use for aligning the text (default is .natural).
	///   - textType: The text field's text type (default is .generic).
	///   - clearsOnBeginEditing: A Boolean value indicating whether the text field removes old text when editing begins (default is false).
	///   - textColor: The color of the text (default is PCColor.black).
	///   - font: The font of the text (default is system font).
	///   - minimumFontSize: The size of the smallest permissible font with which to draw the text field’s text (default is nil).
	///   - borderStyle: The type of border drawn around the text field (default is .none).
	///   - keyboardAppearance: The appearance style of the keyboard that is associated with the text object (default is .default).
	///   - isEnabled: The enabled state to use when drawing the text field (default is true).
	///   - backgroundColor: The text field's background color (default is PCColor.white).
	///   - tintColor: The tint color of the text field (default is nil).
	///   - alpha: Text field's alpha (default is 1.0).
	public init(
		placeholder: String?,
		text: String? = nil,
		attributedPlaceholder: NSAttributedString? = nil,
		attributedText: NSAttributedString? = nil,
		textAlignment: NSTextAlignment = .natural,
		textType: PCTextFieldType = .generic,
		clearsOnBeginEditing: Bool = false,
		textColor: UIColor? = PCColor.black,
		font: UIFont? = nil,
		minimumFontSize: CGFloat? = nil,
		borderStyle: UITextBorderStyle = .none,
		keyboardAppearance: UIKeyboardAppearance = .default,
		isEnabled: Bool = true,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil,
		alpha: CGFloat = 1.0) {

		self.init()

		self.placeholder = placeholder
		self.text = text
		if let attrPlaceholder = attributedPlaceholder {
			self.attributedPlaceholder = attrPlaceholder
		}
		if let attrText = attributedText {
			self.attributedText = attrText
		}
		self.textAlignment = textAlignment
		self.update(forTextType: textType)
		self.clearsOnBeginEditing = clearsOnBeginEditing
		self.textColor = textColor
		if let aFont = font {
			self.font = aFont
		}
		if let aMinimumFontSize = minimumFontSize {
			self.adjustsFontSizeToFitWidth = true
			self.minimumFontSize = aMinimumFontSize
		}
		self.keyboardAppearance = keyboardAppearance
		self.borderStyle = borderStyle
		self.isEnabled = isEnabled

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
		self.alpha = alpha
	}

	private func update(forTextType type: PCTextFieldType) {
		isSecureTextEntry = (type == .password)

		switch type {
		case .emailAddress:
			keyboardType = .emailAddress
			autocorrectionType = .no
			autocapitalizationType = .none

		case .url:
			keyboardType = .URL
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

	/// Check if text field's trimmed text is empty.
	public var isEmpty: Bool {
		return trimmedText.isEmpty
	}

	/// Text field's text trimming whitespaces and new lines.
	public var trimmedText: String {
		return text?.trimmed ?? ""
	}

	/// Text field text as email address (if applicable).
	public var emailAddress: String? {
		guard trimmedText.isEmail else { return nil }
		return trimmedText
	}

	/// Check if text field's text is a valid email address.
	public var hasValidEmail: Bool {
		return emailAddress != nil
	}

	/// Set placeholder text color.
	///
	/// - Parameter color: placeholder text color.
	public func setPlaceHolderTextColor(_ color: UIColor) {
		guard let holder = placeholder, !holder.isEmpty else { return }
		self.attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
	}

}

// MARK: - UISwitch
public extension PCrustable where Self: UISwitch {

	/// Toggle Switch.
	///
	/// - Parameter animated: set true to animate the change (default is true).
	public func toggle(animated: Bool = true) {
		setOn(!isOn, animated: animated)
	}

}

// MARK: - UISegmentedControl
public extension PCrustable where Self: UISegmentedControl {

	/// Create segmented control and set its segment titles in one line.
	///
	/// - Parameters:
	///   - frame: The segmented control frame (default is .zero).
	///   - segmentTitles: segmented control segment titles.
	///   - isEnabled: The enabled state to use when drawing the segmented control (default is true).
	///   - backgroundColor: The text field's background color (default is PCColor.white).
	///   - tintColor: The tint color of the text field (default is nil).
	///   - alpha: Alpha of the segmented control (default is 1.0).
	public init(
		frame: CGRect = .zero,
		segmentTitles: [String],
		isEnabled: Bool = true,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil,
		alpha: CGFloat = 0.0) {

		self.init(frame: frame)

		self.segmentTitles = segmentTitles
		self.isEnabled = isEnabled

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
		self.alpha = alpha
	}

	/// Create segmented control and set its segment images in one line.
	///
	/// - Parameters:
	///   - frame: segmented control frame (default is .zero).
	///   - segmentImages: segmented control segment images.
	///   - isEnabled: The enabled state to use when drawing the segmented control (default is true).
	///   - backgroundColor: The text field's background color (default is PCColor.white).
	///   - tintColor: The tint color of the text field (default is nil).
	///   - alpha: Alpha of the segmented control (default is 1.0).
	public init(
		frame: CGRect = .zero,
		segmentImages: [UIImage],
		isEnabled: Bool = true,
		backgroundColor: UIColor? = PCColor.white,
		tintColor: UIColor? = nil,
		alpha: CGFloat = 0.0) {

		self.init(frame: frame)

		self.segmentImages = segmentImages
		self.isEnabled = isEnabled

		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
		self.alpha = alpha
	}

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
	/// Override this value by setting `preferredHeight` in `PCConstants` to change it app-wide, or just here to set it for this segmented control only.
	var preferredHeight: CGFloat {
		return PCConstants.preferredHeight
	}

	/// Segments titles.
	var segmentTitles: [String] {
		get {
			let range = 0..<numberOfSegments
			return range.flatMap { titleForSegment(at: $0) }
		}
		set {
			removeAllSegments()
			for (index, title) in newValue.enumerated() {
				insertSegment(withTitle: title, at: index, animated: false)
			}
		}
	}

	/// Segments images.
	var segmentImages: [UIImage] {
		get {
			let range = 0..<numberOfSegments
			return range.flatMap { imageForSegment(at: $0) }
		}
		set {
			removeAllSegments()
			for (index, image) in newValue.enumerated() {
				insertSegment(with: image, at: index, animated: false)
			}
		}
	}

}

// swiftlint:enable file_length
