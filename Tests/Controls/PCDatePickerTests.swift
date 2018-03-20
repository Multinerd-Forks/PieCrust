//
//  PCDatePickerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCDatePickerTests: XCTestCase {
    
    func testConvenienceInit() {
        let datePicker = PCDatePicker()
        XCTAssertNil(datePicker.minimumDate)
        XCTAssertNil(datePicker.maximumDate)
        XCTAssertEqual(datePicker.countDownDuration, 0.0)

        let date = Date()

        let datepickerWithArgs = PCDatePicker(datePickerMode: .date, date: date, textColor: .green, tintColor: .red)
        XCTAssertEqual(datepickerWithArgs.datePickerMode, .date)
        XCTAssertEqual(datepickerWithArgs.date, date)

        XCTAssertEqual(datepickerWithArgs.textColor, .green)
        XCTAssertEqual(datepickerWithArgs.tintColor, .red)

        let countDownDatePicker = PCDatePicker(datePickerMode: .countDownTimer, minuteInterval: 2, countDownDuration: 120.0)
        XCTAssertEqual(countDownDatePicker.datePickerMode, .countDownTimer)
        XCTAssertEqual(countDownDatePicker.countDownDuration, 120.0)
    }

}
