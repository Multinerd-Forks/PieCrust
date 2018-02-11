//
//  PCLoadingButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCLoadingButton
open class PCLoadingButton: PCButton {

	/// Create button and set its properties in one line.
	///
	/// - Parameters:
	///   - type: button type (default is .custom).
	///   - title: button title (defaul is nil).
	///   - backgroundColor: button background color (defaul is .white).
	///   - tintColor: button tint color (defaul is .black).
	///   - contentEdgeInsets: button content edge insets (defaul is top: 0, left: 40, bottom: 0, right: 40).
	public convenience init(
		type: UIButtonType = .custom,
		title: String? = nil,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = .black,
		contentEdgeInsets: UIEdgeInsets = .init(top: 0, left: 40, bottom: 0, right: 40)) {

		self.init(type: type)

		self.setTitle(title, for: .normal)
		self.backgroundColor = backgroundColor

		if let color = tintColor {
			self.tintColor = color
			activityIndicator.color = tintColor
		}

		self.contentEdgeInsets = contentEdgeInsets
	}

	/// Loading activity indicator view.
	open lazy var activityIndicator: PCActivityIndicatorView = {
		let indicator = PCActivityIndicatorView(activityIndicatorStyle: .white, color: tintColor)
		indicator.frame = CGRect(x: preferredPadding - 10, y: (preferredHeight / 2) - 10, width: 20.0, height: 20.0)
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

	override open func setViews() {
		super.setViews()

		addSubview(activityIndicator)
	}

}
