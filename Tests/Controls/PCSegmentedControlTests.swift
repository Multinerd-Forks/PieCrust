//
//  PCSegmentedControlTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomSegment: PCSegmentedControl {

    var preferredHeight: CGFloat {
        return 10.0
    }

}

class PCSegmentedControlTests: XCTestCase {
    
    func testTextConvenienceInit() {
        let segment = PCSegmentedControl()
        XCTAssertEqual(segment.frame, .zero)
        XCTAssertTrue(segment.isEnabled)
        XCTAssertNil(segment.backgroundColor)
        XCTAssertEqual(segment.alpha, 1.0)

        let titles = ["hello", "world"]
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        let customSegment = PCSegmentedControl(frame: frame, segmentTitles: titles, isEnabled: false, backgroundColor: PCColor.green, tintColor: PCColor.blue, alpha: 0.5)

        XCTAssertEqual(customSegment.tintColor, .blue)
        XCTAssertEqual(customSegment.alpha, 0.5)
        XCTAssertEqual(customSegment.segmentTitles, titles)
        XCTAssertEqual(customSegment.backgroundColor, PCColor.green)
        XCTAssertEqual(customSegment.isEnabled, false)

    }

    func testImageConvenienceInit() {
        let bundle = Bundle.init(for: PCSegmentedControlTests.self)
        let imageList = [UIImage(named: "piecrust.png", in: bundle, compatibleWith: nil)!, UIImage(named: "piecrust.png", in: bundle, compatibleWith: nil)!]
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        let customSegmentWithImages = PCSegmentedControl(frame: frame, segmentImages: imageList, isEnabled: false, backgroundColor: PCColor.green, tintColor: PCColor.blue, alpha: 0.5)

        XCTAssertEqual(customSegmentWithImages.tintColor, .blue)
        XCTAssertEqual(customSegmentWithImages.alpha, 0.5)
        XCTAssertEqual(customSegmentWithImages.segmentImages, imageList)
        XCTAssertEqual(customSegmentWithImages.backgroundColor, PCColor.green)
        XCTAssertEqual(customSegmentWithImages.isEnabled, false)

    }

    func testPreferredHeight() {
        let segment = PCSegmentedControl()

        let height: CGFloat = UIScreen.main.isSmall ? 40.0 : 48.0
        XCTAssertEqual(segment.preferredHeight, height)

        let customSegment = CustomSegment()
        XCTAssertEqual(customSegment.preferredHeight, 10.0)
    }
    
}
