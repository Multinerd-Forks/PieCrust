//
//  Fadeable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

public protocol Fadeable: class {
	func fadeIn(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)
	func fadeOut(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)
}

public extension Fadeable where Self: UIView {
	
	public func fadeIn(withDuration duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.alpha = 1.0
		}, completion: completion)
	}
	
	public func fadeOut(withDuration duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.alpha = 0
		}, completion: completion)
	}
}
