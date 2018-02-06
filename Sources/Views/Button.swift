//
//  Button.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class Button: UIButton, Shakeable, Borderable, Fadeable {
	
	public convenience init(type: UIButtonType = .custom, title: String? = nil, backgroundColor: UIColor? = .white) {
		self.init(type: type)
		
		self.setTitle(title, for: .normal)
		self.backgroundColor = backgroundColor
		self.contentEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
	}
	
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
