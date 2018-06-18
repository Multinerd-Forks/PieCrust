//
//  PCDatePickerTests.swift
//  PieCrustTests
//
//  Created by Omar Albeik on 6/18/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

final class PCDatePickerTests: XCTestCase {

	func testConvenienceInit() {
		let date = Date()
		let minDate = date.addingTimeInterval(-3600)
		let maxDate = date.addingTimeInterval(3600)

		let datePicker = PCDatePicker(datePickerMode: .date, date: date, minimumDate: minDate, maximumDate: maxDate, minuteInterval: 1, countDownDuration: 0.0, textColor: .red, isEnabled: false, backgroundColor: .yellow, tintColor: .green)

		XCTAssertEqual(datePicker.datePickerMode, .date)
		XCTAssertEqual(datePicker.date, date)

		XCTAssertEqual(datePicker.textColor, .red)
		XCTAssertEqual(datePicker.tintColor, .green)

		let countDownDatePicker = PCDatePicker(datePickerMode: .countDownTimer, minuteInterval: 2, countDownDuration: 120.0)
		XCTAssertEqual(countDownDatePicker.datePickerMode, .countDownTimer)
		XCTAssertEqual(countDownDatePicker.countDownDuration, 120.0)
	}
}
