//
//  PCRoundedImageViewTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 16.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class PCRoundedImageViewTests: XCTestCase {
    
    func testBounds() {
        let pcimageView = PCRoundedImageView()
        XCTAssertEqual(pcimageView.layer.cornerRadius, 0)

        pcimageView.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)

        XCTAssertEqual(pcimageView.layer.cornerRadius, 25)
        XCTAssertEqual(pcimageView.clipsToBounds, true)
    }

    func testImage() {
        let pcimageView = PCRoundedImageView(image: UIImage(named: "piecrust.png"))
        XCTAssertEqual(pcimageView.image, UIImage(named: "piecrust.png"))
        XCTAssertEqual(pcimageView.layer.cornerRadius, 0)

        pcimageView.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)

        XCTAssertEqual(pcimageView.layer.cornerRadius, 25)
        XCTAssertEqual(pcimageView.clipsToBounds, true)
    }

}
