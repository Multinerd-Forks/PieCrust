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
    
    func testBackgroundImage() {
        let navigationController = PCTransparentNavigationController()
        XCTAssertNil(navigationController.backgroundImage)
        navigationController.backgroundImage = UIImage(named: "piecrust.png")
        XCTAssertEqual(navigationController.backgroundImage, UIImage(named: "piecrust.png"))
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
