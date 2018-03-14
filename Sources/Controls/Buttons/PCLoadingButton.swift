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

/// Loading `PCButton`.
///
/// - Conforms to:
///   - `PCLoadingable`
open class PCLoadingButton: PCButton, PCLoadingable {

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
			newValue ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
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
