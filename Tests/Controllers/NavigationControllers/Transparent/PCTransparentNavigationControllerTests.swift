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

private class TestTransparentNavigationController: PCTransparentNavigationController {

    var didCallSetTabBarItem = false
    var didCallSetNavigationItem = false
    var didCallSetGestureRecognizers = false

    var keyboardWillShowNotification: Notification?
    var keyboardDidShowNotification: Notification?
    var keyboardWillChangeFrameNotification: Notification?
    var keyboardDidChangeFrameNotification: Notification?
    var keyboardWillHideNotification: Notification?
    var keyboardDidHideNotification: Notification?

    var player = "idle"

    override func loadView() {
        view = PCView()
    }
    override open func viewDidLoad() {
        super.viewDidLoad()

    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        player = "play"
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        player = "pause"
    }

}

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
        let navigationController = TestTransparentNavigationController()
        
//        navigationController.videoDimColor = nil
//        XCTAssertNil(navigationController.videoDimColor)
//
//        navigationController.videoDimColor = .red
//        XCTAssertEqual(navigationController.videoDimColor, .red)
        let layers = navigationController.view.layer.sublayers
        print("aaaaaaaaa \(layers![0]) aaaaaaaaa")
//        XCTAssertEqual(navigationController.view.layer.sublayers?.first?.backgroundColor, PCColor.red.cgColor)

        navigationController.backgroundVideoUrl = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v") as URL?

    }

    func testViewModes() {
        let navigationController = TestTransparentNavigationController()

        navigationController.viewDidLoad()
        XCTAssertEqual(navigationController.view.contentMode, .scaleToFill)

        navigationController.viewDidAppear(false)
        XCTAssertEqual(navigationController.player, "play")

        navigationController.viewDidDisappear(false)
        XCTAssertEqual(navigationController.player, "pause")
    }

}
