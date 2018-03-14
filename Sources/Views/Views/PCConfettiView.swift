//
//  PCConfettiView.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift
import QuartzCore

/// PCConfettiView.
open class PCConfettiView: PCView {

	private var emitter = CAEmitterLayer()

	private var colors: [UIColor] = [
		UIColor(red: 0.95, green: 0.40, blue: 0.27, alpha: 1.0),
		UIColor(red: 1.00, green: 0.78, blue: 0.36, alpha: 1.0),
		UIColor(red: 0.48, green: 0.78, blue: 0.64, alpha: 1.0),
		UIColor(red: 0.30, green: 0.76, blue: 0.85, alpha: 1.0),
		UIColor(red: 0.58, green: 0.39, blue: 0.55, alpha: 1.0)
	]

	/// Confetti intensity _(default is 0.5)_.
	public var intensity: Float = 0.5

	/// Set this to start or stop confetti.
	public var isActive: Bool = false {
		didSet {
			emitter.birthRate = isActive ? (intensity * 6) : 0
		}
	}

    /// Create a new confetti view and set its properties.
    ///
    /// - Parameters:
    ///   - colors: confetti colors array.
    ///   - intensity: confetti emitter intensity _(default is 0.5)_.
    ///   - backgroundColor: Background color of the confetti view _(default is PCColor.clear)_.
    ///   - tintColor: Text color of the confetti view _(default is nil)_.
    ///   - alpha: Alpha of the confetti view _(default is 1.0)_.
	public convenience init(
        colors: [UIColor] = [],
        intensity: Float = 0.5,
        backgroundColor: UIColor? = PCColor.clear,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init(backgroundColor: backgroundColor, tintColor: tintColor, alpha: alpha)

		if !colors.isEmpty {
			self.colors = colors
		}

		self.intensity = intensity
	}

    /// Use this method to set and add your custom views.
	override open func setViews() {
		isUserInteractionEnabled = false

		emitter.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
		emitter.emitterShape = kCAEmitterLayerLine
		emitter.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1)

		emitter.emitterCells = colors.map { self.confetti(forColor: $0) }
		layer.addSublayer(emitter)
		emitter.birthRate = 0
	}

    /// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
	override open var bounds: CGRect {
		didSet {
			setViews()
		}
	}

	private func confetti(forColor color: UIColor) -> CAEmitterCell {
		let cell = CAEmitterCell()
		cell.birthRate = intensity * 6
		cell.lifetime = intensity * 12
		cell.color = color.cgColor
		cell.velocity = CGFloat(intensity * 350)
		cell.velocityRange = CGFloat(intensity * 80)
		cell.emissionLongitude = .pi
		cell.emissionRange = .pi/4
		cell.spin = CGFloat(intensity * 3.5)
		cell.spinRange = CGFloat(intensity * 4)
		cell.scaleRange = CGFloat(intensity)
		cell.scaleSpeed = CGFloat(intensity * -0.1)

		guard let bundle = Bundle.PieCrustAssetsBundle else { return cell }
		guard let path = bundle.path(forResource: "Images/confetti", ofType: "png") else { return cell }
		guard let image = UIImage(contentsOfFile: path) else { return cell }
		cell.contents = image.cgImage

		return cell
	}

}
