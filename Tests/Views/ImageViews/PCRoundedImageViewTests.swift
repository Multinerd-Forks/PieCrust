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

    let image = UIImage(named: "piecrust.png")
    
    func testBounds() {
        let imageView = PCRoundedImageView()
        XCTAssertEqual(imageView.layer.cornerRadius, 0)
        
        imageView.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        XCTAssertEqual(imageView.layer.cornerRadius, 25)
        XCTAssertEqual(imageView.clipsToBounds, true)
    }
    
    func testImage() {
        let imageView = PCRoundedImageView(image: image)
        XCTAssertEqual(imageView.image, image)
        XCTAssertEqual(imageView.layer.cornerRadius, 0)
        
        imageView.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        XCTAssertEqual(imageView.layer.cornerRadius, 25)
        XCTAssertEqual(imageView.clipsToBounds, true)
    }
    
}
