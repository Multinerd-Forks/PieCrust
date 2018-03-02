//
//  PCLoadingButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCLoadingButton
open class PCLoadingButton: PCButton {

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
	public convenience init(
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

	/// Loading activity indicator view.
	open lazy var activityIndicator: PCActivityIndicatorView = {
		let indicator = PCActivityIndicatorView(activityIndicatorStyle: .white, color: tintColor)
		indicator.frame = CGRect(x: preferredPadding - 10.0, y: (preferredHeight / 2.0) - 10.0, width: 20.0, height: 20.0)
		return indicator
	}()

	/// Set true to show loading activity indicator or false to hide it.
	open var isLoading: Bool {
		set {
			isEnabled = !newValue
			if newValue {
				activityIndicator.startAnimating()
			} else {
				activityIndicator.stopAnimating()
			}
		}
		get {
			return activityIndicator.isAnimating
		}
	}

    /// Use this method to set and add your custom views.
	override open func setViews() {
		super.setViews()

		addSubview(activityIndicator)
	}

}
