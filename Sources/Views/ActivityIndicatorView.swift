//
//  ActivityIndicatorView.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Custom UIActivityIndicatorView.
open class ActivityIndicatorView: UIActivityIndicatorView {

	/// Create activity indicator view and set its properties in one line.
	///
	/// - Parameters:
	///   - style: activity indicator view style (default is .white).
	///   - color: activity indicator view color.
	public convenience init(activityIndicatorStyle style: UIActivityIndicatorViewStyle = .white,
							color: UIColor) {
		
		self.init(activityIndicatorStyle: style)

		self.color = color
	}

}
