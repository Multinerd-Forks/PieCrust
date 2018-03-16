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
        let pcDatePicker = PCDatePicker()
        XCTAssertNil(pcDatePicker.minimumDate)
        XCTAssertNil(pcDatePicker.maximumDate)
        XCTAssertEqual(pcDatePicker.countDownDuration, 0.0)

        let testDate = Date()

        let pcDatepickerWithSomeValues = PCDatePicker(datePickerMode: .date, date: testDate, textColor:
            PCColor.green, tintColor: PCColor.blue, alpha: 0.5)
        XCTAssertEqual(pcDatepickerWithSomeValues.tintColor, PCColor.blue)
        XCTAssertEqual(pcDatepickerWithSomeValues.datePickerMode, .date)
        XCTAssertEqual(pcDatepickerWithSomeValues.alpha, 0.5)
        XCTAssertEqual(pcDatepickerWithSomeValues.textColor, PCColor.green)

        // FIXME: - Fix https://github.com/MobilionOSS/PieCrust/issues/36
        // XCTAssertEqual(pcDatepickerWithSomeValues.date, testDate)

    }
}
