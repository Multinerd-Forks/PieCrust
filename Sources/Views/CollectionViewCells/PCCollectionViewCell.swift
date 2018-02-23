//
//  PCCollectionViewCell.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

/// PCCollectionViewCell.
open class PCCollectionViewCell: UICollectionViewCell, PCLayoutable, PCAnimatable, PCBorderable, PCShadowable {

    /// Initializes and returns a newly allocated collection-view cell object with the specified frame rectangle.
	override public init(frame: CGRect) {
		super.init(frame: frame)

		setViews()
		layoutViews()
	}

    /// Returns a PCCollectionViewCell object initialized from data in a given unarchiver.
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

}
