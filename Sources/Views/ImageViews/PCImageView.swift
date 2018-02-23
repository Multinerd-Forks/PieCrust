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
///
/// - Conforms to:
///   - PCLayoutable
///   - PCKeyboardControllable
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCImageView: UIImageView, PCLayoutable, PCKeyboardControllable, PCAnimatable, PCBorderable, PCShadowable {

    /// Create PCImageView and set its properties in one line.
    ///
    /// - Parameters:
    ///   - image: image.
    ///   - contentMode: contentMode.
    ///   - backgroundColor: background color (default is PCColor.white).
    ///   - alpha: alpha (default is 1.0).
    public convenience init(
        image: UIImage?,
        contentMode: UIViewContentMode,
        backgroundColor: UIColor = PCColor.white,
        tintColor: UIColor = PCColor.white,
        alpha: CGFloat = 1.0) {

        self.init(image: image)

        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.alpha = alpha
    }

	/// Returns an image view initialized with the specified image.
	///
	/// - Parameter image: The initial image to display in the image view. You may specify an image object that contains an animated sequence of images.
	public override init(image: UIImage?) {
		super.init(image: image)

		setViews()
		layoutViews()
	}

	/// Returns an image view initialized with the specified regular and highlighted images.
	///
	/// - Parameters:
	///   - image: The images you specify are used to configure the initial size of the image view itself. Use constraints and the image view’s content mode to adjust the image view’s final size onscreen. This method disables user interactions for the image view by setting the isUserInteractionEnabled property to false.
	///   - highlightedImage: The image to display when the image view is highlighted. You may specify an image object that contains an animated sequence of images.
	public override init(image: UIImage?, highlightedImage: UIImage?) {
		super.init(image: image, highlightedImage: highlightedImage)

		setViews()
		layoutViews()
	}

    /// Initializes and returns a newly allocated image-view object with the specified frame rectangle.
	///
	/// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
	public override init(frame: CGRect) {
		super.init(frame: frame)

		setViews()
		layoutViews()
	}

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
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
