//
//  PCImageViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 15.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable  import PieCrust

class CustomPcImageView: PCImageView {

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
    
    func testConvenienceInit() {

        let testImageView = PCImageView()
        XCTAssertNil(testImageView.image)
        XCTAssertNil(testImageView.highlightedImage)

        let highlightedImageView: PCImageView = PCImageView( image: UIImage(named: "piecrust.png"), highlightedImage: UIImage(named: "piecrust.png"))
        XCTAssertEqual(highlightedImageView.image, UIImage(named: "piecrust.png"))
        XCTAssertEqual(highlightedImageView.highlightedImage, UIImage(named: "piecrust.png") )

    }

    func testSetViews() {

        let imageView: PCImageView = PCImageView()
        XCTAssertEqual(imageView.backgroundColor, PCColor.white)
    }

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        let pcImageView = PCImageView(coder: coder)
        XCTAssertNotNil(pcImageView)

        let customPcImageView = CustomPcImageView(coder: coder)
        XCTAssertEqual(customPcImageView?.didCallSetViews, true)
        XCTAssertEqual(customPcImageView?.didCallLayoutViews, true)
    }

}
