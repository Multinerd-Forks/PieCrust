//
//  PCActivityIndicatorView.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCActivityIndicatorView.
open class PCActivityIndicatorView: UIActivityIndicatorView {

	/// Create activity indicator view and set its properties in one line.
	///
	/// - Parameters:
	///   - activityIndicatorStyle: The basic appearance of the activity indicator (default is .white).
    ///   - hidesWhenStopped: A Boolean value that controls whether the receiver is hidden when the animation is stopped (default is true).
    ///   - color: The color of the activity indicator.
    ///   - alpha: Activity indicator's alpha (default is 1.0).
	public convenience init(
		activityIndicatorStyle: UIActivityIndicatorViewStyle = .white,
        hidesWhenStopped: Bool = true,
        color: UIColor?,
        alpha: CGFloat = 1.0) {

		self.init(activityIndicatorStyle: activityIndicatorStyle)

        self.hidesWhenStopped = hidesWhenStopped
		self.color = color
        self.alpha = alpha
	}

}
