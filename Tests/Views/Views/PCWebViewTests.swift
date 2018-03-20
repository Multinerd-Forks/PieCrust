//
//  PCWebViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomWebView: PCWebView {

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
        let webView = PCWebView()
        XCTAssertEqual(webView.backgroundColor, PCColor.white)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let pcWebViewWithCustomFrame = PCWebView(frame: frame)
        XCTAssertEqual(pcWebViewWithCustomFrame.frame, frame)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let webView = PCWebView(coder: coder)
        XCTAssertNotNil(webView)

        let customWebView = CustomWebView(coder: coder)
        XCTAssertEqual(customWebView?.didCallSetViews, true)
        XCTAssertEqual(customWebView?.didCallLayoutViews, true)
    }
    
}
