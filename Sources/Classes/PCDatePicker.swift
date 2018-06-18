//
//  PCDatePicker.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCDatePicker.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
open class PCDatePicker: UIDatePicker, Crustable, Animatable, Borderable, Shadowable {}

// MARK: - Default implementation for UIDatePicker.
public extension Crustable where Self: UIDatePicker {

	/// Creates and returns a new UIDatePicker with setting its properties in one line.
	///
	/// - Parameters:
	///   - datePickerMode: The mode of the date picker.
	///   - date: Initial date of the picker _(default is nil)_.
	///   - minimumDate: The minimum date that a date picker can show _(default is nil)_.
	///   - maximumDate: The maximum date that a date picker can show _(default is nil)_.
	///   - minuteInterval: The interval at which the date picker should display minutes _(default is 1)_.
	///   - countDownDuration: The value displayed by the date picker when the mode property is set to countDownTimer _(default is 0.0)_.
	///   - textColor: Text color of the date picker _(default is nil)_.
	///   - isEnabled: The enabled state to use when drawing the date picker _(default is true)_.
	///   - backgroundColor: Background color of the date picker _(default is .white)_.
	///   - tintColor: Text color of the date picker _(default is nil)_.
	public init(
		datePickerMode: UIDatePickerMode,
		date: Date? = nil,
		minimumDate: Date? = nil,
		maximumDate: Date? = nil,
		minuteInterval: Int = 1,
		countDownDuration: TimeInterval = 0.0,
		textColor: UIColor? = nil,
		isEnabled: Bool = true,
		backgroundColor: UIColor? = .white,
		tintColor: UIColor? = nil) {

		self.init()

		self.datePickerMode = datePickerMode

		if let aDate = date {
			self.date = aDate
		}
		self.minimumDate = minimumDate
		self.maximumDate = maximumDate

		self.minuteInterval = minuteInterval

		if datePickerMode == .countDownTimer {
			self.countDownDuration = countDownDuration
		}

		if let color = textColor {
			self.textColor = color
		}

		self.isEnabled = isEnabled
		self.backgroundColor = backgroundColor
		if let color = tintColor {
			self.tintColor = color
		}
	}

	/// Text color of the date picker.
	public var textColor: UIColor? {
		set {
			setValue(newValue, forKeyPath: "textColor")
		}
		get {
			return value(forKeyPath: "textColor") as? UIColor
		}
	}

}
