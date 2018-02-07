//
//  Pushable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 7.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

public protocol Pushable: class {
	func pushIn(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)
	func pushOut(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)
}

public extension Pushable where Self: UIView {
	
	public func pushIn(withDuration duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.transform = .init(scaleX: 0.95, y: 0.95)
		}, completion: completion)
	}
	
	public func pushOut(withDuration duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.transform = .identity
		}, completion: completion)
	}
	
}
