//
//  Confettiable.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to `Confettiable` protocol to show confetti in a view controller or a view.
public protocol Confettiable: AnyObject {

	/// Show confetti.
	///
	/// - Parameters:
	///   - duration: confetti duration in seconds.
	///   - delay: confetti delay in seconds.
	func showConfetti(duration: TimeInterval, delay: TimeInterval)

}

// MARK: - Default implementation for UIViewController.
public extension Confettiable where Self: UIViewController {

	/// Show confetti.
	///
	/// - Parameters:
	///   - duration: confetti duration in seconds _(default is 2.0)_.
	///   - delay: confetti delay in seconds _(default is 0.0)_.
	func showConfetti(duration: TimeInterval = 2.0, delay: TimeInterval = 0) {
		let confettiView = PCConfettiView(frame: view.bounds)
		confettiView.layer.zPosition = 100

		DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			self.view.addSubview(confettiView)
			confettiView.isActive = true
		}

		let totalDelay = delay + duration
		DispatchQueue.main.asyncAfter(deadline: .now() + totalDelay) {
			confettiView.isActive = false

			DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
				confettiView.removeFromSuperview()
			}
		}

	}
}

// MARK: - Default implementation for UIView.
public extension Confettiable where Self: UIView {

	/// Show confetti.
	///
	/// - Parameters:
	///   - duration: confetti duration in seconds _(default is 2.0)_.
	///   - delay: confetti delay in seconds _(default is 0.0)_.
	func showConfetti(duration: TimeInterval = 2.0, delay: TimeInterval = 0) {
		let confettiView = PCConfettiView(frame: bounds)
		confettiView.layer.zPosition = 100

		DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			self.addSubview(confettiView)
			confettiView.isActive = true
		}

		let totalDelay = delay + duration
		DispatchQueue.main.asyncAfter(deadline: .now() + totalDelay) {
			confettiView.isActive = false

			DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
				confettiView.removeFromSuperview()
			}
		}

	}
}
