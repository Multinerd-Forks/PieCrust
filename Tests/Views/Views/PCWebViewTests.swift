//
//  PCWebViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class CustomWebView: PCWebView {

    var didCallSetViews = false
    var didCallLayoutViews = false
    override func setViews() {
        super.setViews()
        didCallSetViews = true
    }
    override func layoutViews() {
        super.layoutViews()
        didCallLayoutViews = true
    }
}


class PCWebViewTests: XCTestCase {

    func testConvenienceInit() {
        let pcWebView = PCWebView()
        XCTAssertEqual(pcWebView.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let pcWebViewWithCustomFrame = PCWebView(frame: frame)
        XCTAssertEqual(pcWebViewWithCustomFrame.frame, CGRect(x: 0, y: 0, width: 100, height: 50))

    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let pcWebView = PCWebView(coder: coder)
        XCTAssertNotNil(pcWebView)

         let customWebView = CustomWebView(coder: coder)
        XCTAssertEqual(customWebView?.didCallSetViews, true)
        XCTAssertEqual(customWebView?.didCallLayoutViews, true)
    }
    
}
