//
//  Shakeable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//

import UIKit

public protocol Shakeable {
	func shake()
}

public extension Shakeable {
	func shake() {}
}

public extension Shakeable where Self: UIView {
	
	public func shake(duration: TimeInterval = 1, completion:(() -> Void)? = nil) {
		CATransaction.begin()
		let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		CATransaction.setCompletionBlock(completion)
		animation.duration = duration
		animation.values = [-15.0, 15.0, -12.0, 12.0, -8.0, 8.0, -3.0, 3.0, 0.0]
		layer.add(animation, forKey: "shake")
		CATransaction.commit()
	}
	
}
