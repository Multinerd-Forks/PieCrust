//
//  PublicExtensions.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

public extension Notification {
	
	public var keyboardSize: CGSize? {
		return (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
	}
	
	public var keyboardAnimationDuration: Double? {
		return userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
	}
	
}
