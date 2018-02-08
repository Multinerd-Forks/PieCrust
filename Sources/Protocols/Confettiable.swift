//
//  Confettiable.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

public protocol Confettiable: class {
	func showConfetti(duration: TimeInterval, delay: TimeInterval)
}

 public extension Confettiable where Self: UIViewController {
	func showConfetti(duration: TimeInterval = 2.0, delay: TimeInterval = 0) {
		let confettiView = ConfettiView(frame: view.bounds)
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
