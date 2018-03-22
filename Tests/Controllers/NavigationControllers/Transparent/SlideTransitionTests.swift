//
//  SlideTransitionTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 20.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

class SlideTransitionTests: XCTestCase {

    func testConvenienceInit() {
        let transition = SlideTransition(transitionOperation: UINavigationControllerOperation.push)
        let slideTransition = SlideTransitionFrames(
            transitionOperation: UINavigationControllerOperation.push,
            slideViewSize: UIScreen.main.bounds.size)

        XCTAssertEqual(transition.transitionFrames.toView.end, slideTransition.toView.end)

        let slideTransitionPop = SlideTransitionFrames(
            transitionOperation: UINavigationControllerOperation.pop,
            slideViewSize: UIScreen.main.bounds.size)

        XCTAssertEqual(transition.transitionFrames.toView.end, slideTransitionPop.toView.end)
    }

    func testAnimateTransition() {
        let transition = SlideTransition(transitionOperation: UINavigationControllerOperation.push)
    }

    func testTransitionDuration() {
        let transition = SlideTransition(transitionOperation: UINavigationControllerOperation.push)
        XCTAssertEqual(transition.transitionDuration(using: UIViewControllerContextTransitioning?.none), 0.35)

    }
    
}
