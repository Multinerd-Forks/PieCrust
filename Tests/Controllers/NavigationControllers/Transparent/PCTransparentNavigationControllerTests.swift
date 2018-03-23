//
//  PCTransparentNavigationControllerTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
import AVFoundation
@testable import PieCrust

class PCTransparentNavigationControllerTests: XCTestCase {

    let image = UIImage(named: "piecrust.png")
    
    func testBackgroundImage() {
        let navigationController = PCTransparentNavigationController()
        XCTAssertNil(navigationController.backgroundImage)
        navigationController.backgroundImage = image
        XCTAssertEqual(navigationController.backgroundImage, image)
    }

    func testBackgroundVideoUrl() {
        let navigationController = PCTransparentNavigationController()
        XCTAssertNil(navigationController.backgroundVideoUrl)

        navigationController.backgroundVideoUrl = nil
        XCTAssertNil(navigationController.backgroundVideoUrl)

        let url = URL(string: "https://www.youtube.com")
        navigationController.backgroundVideoUrl = url
        XCTAssert((navigationController.backgroundVideoUrl != nil))
        XCTAssertEqual(navigationController.backgroundVideoUrl, url)
    }

    func testVideoDimColor() {
        let navigationController = PCTransparentNavigationController()
        
        navigationController.videoDimColor = nil
        XCTAssertNil(navigationController.videoDimColor)

        navigationController.videoDimColor = .red
        XCTAssertEqual(navigationController.videoDimColor, .red)
    }

}
