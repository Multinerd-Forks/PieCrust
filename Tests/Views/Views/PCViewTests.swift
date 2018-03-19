//
//  PCViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 19.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class CustomPcView: PCView {

    var didCallSetViews = false
    var didCallLayoutViews = false
    var didCallhandleKeyboardWillShow = false
    var didCallhandleKeyboardDidShow = false
    var didCallhandleKeyboardWillHide = false
    var didCallhandleKeyboardDidHide = false
    var didCallhandleKeyboardWillChangeFrame = false
    var didCallhandleKeyboardDidChangeFrame = false

    override func setViews() {
        super.setViews()
        didCallSetViews = true
    }
    override func layoutViews() {
        super.layoutViews()
        didCallLayoutViews = true
    }

}

class PCViewTests: XCTestCase {
    
   func testConvenienceInit() {
    let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
    let view = PCView(frame: frame)
    XCTAssertEqual(view.frame, frame)
   }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let webView = PCView(coder: coder)
        XCTAssertNotNil(webView)

        let customView = CustomPcView(coder: coder)
        XCTAssertNotNil(customView)

        XCTAssertEqual(customView!.didCallSetViews, true)
        XCTAssertEqual(customView!.didCallLayoutViews, true)
    }
    
}
