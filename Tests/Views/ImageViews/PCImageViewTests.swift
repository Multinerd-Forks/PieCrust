//
//  PCImageViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 15.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

private class CustomPcImageView: PCImageView {

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

class PCImageViewTests: XCTestCase {

    let image = UIImage(named: "piecrust.png")
    
    func testConvenienceInit() {
        let imageView = PCImageView()
        XCTAssertNil(imageView.image)
        XCTAssertNil(imageView.highlightedImage)

        let highlightedImageView: PCImageView = PCImageView( image: image, highlightedImage: image)
        XCTAssertEqual(highlightedImageView.image, image)
        XCTAssertEqual(highlightedImageView.highlightedImage, image)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let pcImageView = PCImageView(coder: coder)
        XCTAssertNotNil(pcImageView)

        let customImageView = CustomPcImageView(coder: coder)
        XCTAssertNotNil(customImageView)
        XCTAssert(customImageView!.didCallSetViews)
        XCTAssert(customImageView!.didCallLayoutViews)
    }

    func testSetViews() {
        let imageView = PCImageView()
        
        XCTAssertEqual(imageView.backgroundColor, PCColor.white)
    }

}
