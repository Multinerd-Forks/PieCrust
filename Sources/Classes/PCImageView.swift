//
//  PCImageView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCImageView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCImageView: UIImageView, Crustable, Animatable, Borderable, Shadowable {

	/// Returns an image view initialized with the specified image.
	///
	/// - Parameter image: The initial image to display in the image view. You may specify an image object that contains an animated sequence of images.
	public override init(image: UIImage?) {
		super.init(image: image)

		setupViews()
		setupLayout()
	}

	/// Returns an image view initialized with the specified regular and highlighted images.
	///
	/// - Parameters:
	///   - image: The images you specify are used to configure the initial size of the image view itself. Use constraints and the image view’s content mode to adjust the image view’s final size onscreen. This method disables user interactions for the image view by setting the isUserInteractionEnabled property to false.
	///   - highlightedImage: The image to display when the image view is highlighted. You may specify an image object that contains an animated sequence of images.
	public override init(image: UIImage?, highlightedImage: UIImage?) {
		super.init(image: image, highlightedImage: highlightedImage)

		setupViews()
		setupLayout()
	}

	/// Initializes and returns a newly allocated view object with the specified frame rectangle.
	///
	/// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
	public override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupLayout()
	}

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setupViews()
		setupLayout()
	}

	/// Setup view and its subviews here.
	open func setupViews() {
		backgroundColor = .white
	}

	/// Setup view and its subviews autolayout here.
	open func setupLayout() {}

}

// MARK: - Default implementation for UIImageView.
public extension Crustable where Self: UIImageView {

	/// Creates and returns a new UIImageView with setting its properties in one line.
	///
	/// - Parameters:
	///   - image: image.
	///   - contentMode: contentMode.
	///   - backgroundColor: background color _(default is .white)_.
	///   - tintColor: Text color of the view _(default is nil)_.
	public init(
		image: UIImage?,
		contentMode: UIViewContentMode,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init(image: image)

		self.contentMode = contentMode
		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}
	}

}
