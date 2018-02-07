//
//  SegmentedControl.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

class SegmentedControl: UISegmentedControl, Animatable, Borderable {

	override public init(frame: CGRect) {
		super.init(frame: frame)
		
		setViews()
		layoutViews()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setViews()
		layoutViews()
	}
	
	open func setViews() {
		backgroundColor = .white
	}
	
	open func layoutViews() {}
	
	open var preferredPadding: CGFloat {
		return 20
	}
	
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 42 : 48
	}

}
