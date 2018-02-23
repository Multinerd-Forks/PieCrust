//
//  PCAnimatable.swift
//  PieCrust
//
//  Created by Omar Albeik on 7.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to PCAnimatable protocol to animate views.
public protocol PCAnimatable: class {

	/// Fade in view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds.
	///   - delay: animation delay in seconds.
	///   - completion: optional completion handler to run with animation finishes.
	func fadeIn(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)

	/// Fade out view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds.
	///   - delay: animation delay in seconds.
	///   - completion: optional completion handler to run with animation finishes.
	func fadeOut(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)

	/// Pop in view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds.
	///   - delay: animation delay in seconds.
	///   - completion: optional completion handler to run with animation finishes.
	func popIn(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)

	/// Pop out view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds.
	///   - delay: animation delay in seconds.
	///   - completion: optional completion handler to run with animation finishes.
	func popOut(withDuration duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?)

	/// Shake view horizontally.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds.
	///   - delay: animation delay in seconds.
	///   - completion: optional completion handler to run with animation finishes.
	func shake(withDuration duration: TimeInterval, delay: TimeInterval, completion: (() -> Void)?)

}

public extension PCAnimatable where Self: UIView {

	/// Fade in view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds (default is 1 second).
	///   - delay: animation delay in seconds (default is 0 second).
	///   - completion: optional completion handler to run with animation finishes (default is nil)
	public func fadeIn(withDuration duration: TimeInterval = 1.0,
					   delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {

		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.alpha = 1.0
		}, completion: completion)
	}

	/// Fade out view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds (default is 1 second).
	///   - delay: animation delay in seconds (default is 0 second).
	///   - completion: optional completion handler to run with animation finishes (default is nil)
	public func fadeOut(withDuration duration: TimeInterval = 1.0,
						delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {

		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.alpha = 0.0
		}, completion: completion)
	}

	/// Pop in view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds (default is 1 second).
	///   - delay: animation delay in seconds (default is 0 second).
	///   - completion: optional completion handler to run with animation finishes (default is nil)
	public func popIn(withDuration duration: TimeInterval = 0.2,
					  delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {

		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.transform = .init(scaleX: 0.95, y: 0.95)
		}, completion: completion)
	}

	/// Pop out view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds (default is 1 second).
	///   - delay: animation delay in seconds (default is 0 second).
	///   - completion: optional completion handler to run with animation finishes (default is nil)
	public func popOut(withDuration duration: TimeInterval = 0.2,
					   delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {

		UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
			self.transform = .identity
		}, completion: completion)
	}

	/// Shake view.
	///
	/// - Parameters:
	///   - duration: animation duration in seconds (default is 1 second).
	///   - delay: animation delay in seconds (default is 0 second).
	///   - completion: optional completion handler to run with animation finishes (default is nil).
	public func shake(withDuration duration: TimeInterval = 1.0,
					  delay: TimeInterval = 0.0, completion: (() -> Void)? = nil) {

		DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			CATransaction.begin()
			let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
			animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
			CATransaction.setCompletionBlock(completion)
			animation.duration = duration
			animation.values = [-15.0, 15.0, -12.0, 12.0, -8.0, 8.0, -3.0, 3.0, 0.0]
			self.layer.add(animation, forKey: "shake")
			CATransaction.commit()
		}
	}

}
