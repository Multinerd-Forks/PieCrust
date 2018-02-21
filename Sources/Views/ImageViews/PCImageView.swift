//
//  PCImageView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

/// PCImageView.
open class PCImageView: UIImageView, PCAnimatable, PCBorderable {

    /// Returns an image view initialized with the specified image.
	public override init(image: UIImage?) {
		super.init(image: image)

		setViews()
		layoutViews()
	}

    /// Returns an image view initialized with the specified regular and highlighted images.
	public override init(image: UIImage?, highlightedImage: UIImage?) {
		super.init(image: image, highlightedImage: highlightedImage)

		setViews()
		layoutViews()
	}

    /// Initializes and returns a newly allocated image-view object with the specified frame rectangle.
	public override init(frame: CGRect) {
		super.init(frame: frame)

		setViews()
		layoutViews()
	}

    /// Returns a PCView object initialized from data in a given unarchiver.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setViews()
		layoutViews()
	}

	/// Use this method to set and add your custom views.
	open func setViews() {
		backgroundColor = PCColor.white
	}

	/// Use this method to layout your custom views using SnapKit.
	open func layoutViews() {}

	/// Preferred padding for autolayout (default is 20).
	open var preferredPadding: CGFloat {
		return 20.0
	}

	/// Call this method from view contoller to handle KeyboardWillShow notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	open func handleKeyboardWillShow(_ notification: Notification) {}

	/// Call this method from view contoller to handle handleKeyboardDidShow notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	open func handleKeyboardDidShow(_ notification: Notification) {}

	/// Call this method from view contoller to handle handleKeyboardWillHide notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	open func handleKeyboardWillHide(_ notification: Notification) {}

	/// Call this method from view contoller to handle handleKeyboardDidHide notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	open func handleKeyboardDidHide(_ notification: Notification) {}

	/// Call this method from view contoller to handle handleKeyboardWillChangeFrame notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	open func handleKeyboardWillChangeFrame(_ notification: Notification) {}

	/// Call this method from view contoller to handle handleKeyboardDidChangeFrame notification.
	///
	/// - Parameter notification: keyboard notificaton sent from system.
	open func handleKeyboardDidChangeFrame(_ notification: Notification) {}

}
