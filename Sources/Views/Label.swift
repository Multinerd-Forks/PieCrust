//
//  Label.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class Label: UILabel, Shakeable, Borderable {

	public convenience init (text: String? = "", textAlignment: NSTextAlignment = .natural, numberOfLines: Int = 1) {
		self.init()
		
		self.text = text
		self.textAlignment = textAlignment
		self.numberOfLines = numberOfLines
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
	
}
