//
//  PCScrollView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// UIScrollView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCScrollView: UIScrollView, Crustable, Animatable, Borderable, Shadowable {

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

// MARK: - Default implementation for UIScrollView.
public extension Crustable where Self: UIScrollView {

	/// Creates and returns a new UIScrollView with setting its properties in one line.
	///
	/// - Parameters:
	///   - isScrollEnabled: A Boolean value that determines whether scrolling is enabled _(default is true)_.
	///   - isDirectionalLockEnabled: A Boolean value that determines whether scrolling is disabled in a particular direction _(default is false)_.
	///   - isPagingEnabled: A Boolean value that determines whether paging is enabled for the scroll view _(default is false)_.
	///   - scrollsToTop: A Boolean value that controls whether the scroll-to-top gesture is enabled _(default is true)_.
	///   - bounces: A Boolean value that controls whether the scroll view bounces past the edge of content and back again _(default is true)_.
	///   - alwaysBounceVertical: A Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content _(default is false)_.
	///   - alwaysBounceHorizontal: A Boolean value that determines whether bouncing always occurs when horizontal scrolling reaches the end of the content view _(default is false)_.
	///   - minimumZoomScale: A floating-point value that specifies the minimum scale factor that can be applied to the scroll view's content _(default is 1.0)_.
	///   - maximumZoomScale: A floating-point value that specifies the maximum scale factor that can be applied to the scroll view's content _(default is 1.0)_.
	///   - bouncesZoom: A Boolean value that determines whether the scroll view animates the content scaling when the scaling exceeds the maximum or minimum limits _(default is true)_.
	///   - keyboardDismissMode: The manner in which the keyboard is dismissed when a drag begins in the scroll view _(default is .none)_.
	///   - backgroundColor: Background color of the view _(default is .white)_.
	///   - tintColor: Text color of the view _(default is nil)_.
	public init(
		isScrollEnabled: Bool = true,
		isDirectionalLockEnabled: Bool = false,
		isPagingEnabled: Bool = false,
		scrollsToTop: Bool = true,
		bounces: Bool = true,
		alwaysBounceVertical: Bool = false,
		alwaysBounceHorizontal: Bool = false,
		minimumZoomScale: CGFloat = 1.0,
		maximumZoomScale: CGFloat = 1.0,
		bouncesZoom: Bool = true,
		keyboardDismissMode: UIScrollViewKeyboardDismissMode = .none,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init()

		self.isScrollEnabled = isScrollEnabled
		self.isDirectionalLockEnabled = isDirectionalLockEnabled
		self.isPagingEnabled = isPagingEnabled
		self.scrollsToTop = scrollsToTop
		self.bounces = bounces
		self.alwaysBounceVertical = alwaysBounceVertical
		self.alwaysBounceHorizontal = alwaysBounceHorizontal
		self.minimumZoomScale = minimumZoomScale
		self.maximumZoomScale = maximumZoomScale
		self.bouncesZoom = bouncesZoom
		self.keyboardDismissMode = keyboardDismissMode

		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
		}
	}

}
