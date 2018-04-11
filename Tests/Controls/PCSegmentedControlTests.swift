//
//  PCSegmentedControlTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class TestSegment: PCSegmentedControl {

    var preferredHeight: CGFloat {
        return 10.0
    }

}

class PCSegmentedControlTests: XCTestCase {
    
    func testTextConvenienceInit() {
        let segmentedControl = PCSegmentedControl()
        XCTAssertEqual(segmentedControl.frame, .zero)
        XCTAssertTrue(segmentedControl.isEnabled)
        XCTAssertNil(segmentedControl.backgroundColor)
        XCTAssertEqual(segmentedControl.alpha, 1.0)

        let titles = ["hello", "world"]
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        let customSegment = PCSegmentedControl(frame: frame, segmentTitles: titles, isEnabled: false,
                                               backgroundColor: PCColor.green, tintColor: PCColor.blue, alpha: 0.5)

        XCTAssertEqual(customSegment.tintColor, .blue)
        XCTAssertEqual(customSegment.alpha, 0.5)
        XCTAssertEqual(customSegment.segmentTitles, titles)
        XCTAssertEqual(customSegment.backgroundColor, PCColor.green)
        XCTAssertEqual(customSegment.isEnabled, false)
        XCTAssertEqual(customSegment.frame, frame)
    }

    func testImageConvenienceInit() {
        let bundle = Bundle.init(for: PCSegmentedControlTests.self)
        let imageList = [UIImage](repeatElement(UIImage(named: "piecrust.png", in: bundle, compatibleWith: nil)!, count: 2))
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        let segmentedControl = PCSegmentedControl(frame: frame, segmentImages: imageList, isEnabled: false,
                                                  backgroundColor: PCColor.green, tintColor: PCColor.blue, alpha: 0.5)
        
        XCTAssertEqual(segmentedControl.tintColor, .blue)
        XCTAssertEqual(segmentedControl.alpha, 0.5)
        XCTAssertEqual(segmentedControl.segmentImages, imageList)
        XCTAssertEqual(segmentedControl.backgroundColor, PCColor.green)
        XCTAssertEqual(segmentedControl.isEnabled, false)
    }

    func testPreferredHeight() {
        let segmentedControl = PCSegmentedControl()

        let height: CGFloat = UIScreen.main.isSmall ? 40.0 : 48.0
        XCTAssertEqual(segmentedControl.preferredHeight, height)

        let customSegment = TestSegment()
        XCTAssertEqual(customSegment.preferredHeight, 10.0)
    }
    
}
