//
//  View.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit
import SnapKit

open class View: UIView, Borderable, Animatable {

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

	open func handleKeyboardWillShow(_ sender: Notification) {}
	
	open func handleKeyboardDidShow(_ sender: Notification) {}
	
	open func handleKeyboardWillHide(_ sender: Notification) {}
	
	open func handleKeyboardDidHide(_ sender: Notification) {}
	
	open func handleKeyboardWillChangeFrame(_ sender: Notification) {}
	
	open func handleKeyboardDidChangeFrame(_ sender: Notification) {}
	
}

