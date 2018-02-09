//
//  PCConfettiable.swift
//  PieCrust
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// Conform to PCConfettiable protocol to show confetti.
public protocol PCConfettiable: class {

	/// Show confetti.
	///
	/// - Parameters:
	///   - duration: confetti duration in seconds.
	///   - delay: confetti delay in seconds.
	func showConfetti(duration: TimeInterval, delay: TimeInterval)

}

public extension PCConfettiable where Self: UIViewController {

	/// Show confetti.
	///
	/// - Parameters:
	///   - duration: confetti duration in seconds (default is 2).
	///   - delay: confetti delay in seconds (default is 0).
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
			DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
				confettiView.removeFromSuperview()
			})
		}

	}
}
