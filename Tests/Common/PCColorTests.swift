//
//  PCColorTests.swift
//  PieCrustTests
//
//  Created by ahmet.yilmaz on 23.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import XCTest
@testable import PieCrust

// swiftlint:disable function_body_length

class PCColorTests: XCTestCase {

    func testInit() {
        var color = PCColor(hex: 0xFFF)
        XCTAssertEqual(color?.rgbComponents.red, 0)
        XCTAssertEqual(color?.rgbComponents.green, 0xf)
        XCTAssertEqual(color?.rgbComponents.blue, 0xff)
        XCTAssertEqual(color?.alpha, 1.0)

        color = PCColor(hex: 0xFFFFFFF)
        XCTAssertEqual(color?.rgbComponents.red, 0xff)
        XCTAssertEqual(color?.rgbComponents.green, 0xff)
        XCTAssertEqual(color?.rgbComponents.blue, 0xff)
        XCTAssertEqual(color?.alpha, 1.0)

        color = PCColor(hex: 0x123456, transparency: 1.0)
        XCTAssertEqual(color?.rgbComponents.red, 0x12)
        XCTAssertEqual(color?.rgbComponents.green, 0x34)
        XCTAssertEqual(color?.rgbComponents.blue, 0x56)
        XCTAssertEqual(color?.alpha, 1.0)

        color = PCColor(hex: 0x999, transparency: 21.0)
        XCTAssertEqual(color?.rgbComponents.red, 0)
        XCTAssertEqual(color?.rgbComponents.green, 0x09)
        XCTAssertEqual(color?.rgbComponents.blue, 0x99)
        XCTAssertEqual(color?.alpha, 1.0)

        color = PCColor(hex: 0xaabbcc, transparency: 0.0)
        XCTAssertEqual(color?.rgbComponents.red, 0xaa)
        XCTAssertEqual(color?.rgbComponents.green, 0xbb)
        XCTAssertEqual(color?.rgbComponents.blue, 0xcc)
        XCTAssertEqual(color?.alpha, 0.0)

        color = PCColor(hex: 0x1, transparency: 0.5)
        XCTAssertEqual(color?.rgbComponents.red, 0)
        XCTAssertEqual(color?.rgbComponents.green, 0)
        XCTAssertEqual(color?.rgbComponents.blue, 1)
        XCTAssertEqual(color?.alpha, 0.5)

        let color1 = PCColor(hex: 0xFFF, transparency: -0.4)
        let color2 = PCColor(hex: 0xFFF, transparency: 0)
        XCTAssertEqual(color1, color2)

        let color3 = PCColor(hex: 0xFFF, transparency: 1.5)
        let color4 = PCColor(hex: 0xFFF, transparency: 1)
        XCTAssertEqual(color3, color4)

        let color5 = PCColor(hex: 0xFFFFFF)
        XCTAssertNotNil(color5)
        XCTAssertEqual(color5!.rgbComponents.red, 255)
        XCTAssertEqual(color5!.rgbComponents.green, 255)
        XCTAssertEqual(color5!.rgbComponents.blue, 255)

        let color6 = PCColor(hex: 0)
        XCTAssertNotNil(color6)
        XCTAssertEqual(color6!.rgbComponents.red, 0)
        XCTAssertEqual(color6!.rgbComponents.green, 0)
        XCTAssertEqual(color6!.rgbComponents.blue, 0)

        let color7 = PCColor(white: 1, alpha: 1)
        XCTAssertEqual(color7.rgbComponents.red, 255)
        XCTAssertEqual(color7.rgbComponents.green, 255)
        XCTAssertEqual(color7.rgbComponents.blue, 255)
    }

    func testFailableInit() {
        var color = PCColor(hexString: "0xFFFFFF")
        XCTAssertNotNil(color)

        color = PCColor(hexString: "#FFFFFF")
        XCTAssertNotNil(color)

        color = PCColor(hexString: "FFFFFF")
        XCTAssertNotNil(color)

        color = PCColor(hexString: "#ABC")
        XCTAssertNotNil(color)

        color = PCColor(hexString: "#GGG")
        XCTAssertNil(color)

        color = PCColor(hexString: "4#fff")
        XCTAssertNil(color)

        color = PCColor(hexString: "FFFFFFF")
        XCTAssertNotNil(color)

        color = PCColor(hexString: "FFFFFFF", transparency: 1.0)
        XCTAssertNotNil(color)
        XCTAssertEqual(color?.alpha, 1.0)

        color = PCColor(hexString: "FFFFFFF", transparency: 0.0)
        XCTAssertNotNil(color)
        XCTAssertEqual(color?.alpha, 0.0)

        color = PCColor(hexString: "FFFFFFF", transparency: 2.0)
        XCTAssertNotNil(color)
        XCTAssertEqual(color?.alpha, 1.0)

        color = PCColor(hexString: "FFFFFFF", transparency: -1.0)
        XCTAssertNotNil(color)
        XCTAssertEqual(color?.alpha, 0.0)

        color = PCColor(red: -10, green: 124, blue: 121)
        XCTAssertNil(color)

        color = PCColor(red: 430, green: 124, blue: 121)
        XCTAssertNil(color)

        color = PCColor(red: 10, green: -10, blue: 121)
        XCTAssertNil(color)

        color = PCColor(red: 10, green: 736, blue: 121)
        XCTAssertNil(color)

        color = PCColor(red: 10, green: 124, blue: -10)
        XCTAssertNil(color)

        color = PCColor(red: 40, green: 124, blue: 726)
        XCTAssertNil(color)
    }

    func testInitWithComponents() {
        var r1: CGFloat = 0
        var r2: CGFloat = 0
        var g1: CGFloat = 0
        var g2: CGFloat = 0
        var b1: CGFloat = 0
        var b2: CGFloat = 0
        var alpha1: CGFloat = 0
        var alpha2: CGFloat = 0

        var color1 = PCColor(red: 255, green: 244, blue: 255, transparency: 2.0)
        var color2 = PCColor(red: 1.0, green: 244.0 / 255.0, blue: 1.0, alpha: 1.0)
        color1?.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
        XCTAssertEqual(r1, r2)
        XCTAssertEqual(g1, g2)
        XCTAssertEqual(b1, b2)
        XCTAssertEqual(alpha1, alpha2)

        color1 = PCColor(red: 25, green: 244, blue: 55, transparency: -1.0)
        color2 = PCColor(red: 25.0 / 255.0, green: 244.0 / 255.0, blue: 55.0 / 255.0, alpha: 0.0)
        color1?.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
        XCTAssertEqual(r1, r2)
        XCTAssertEqual(g1, g2)
        XCTAssertEqual(b1, b2)
        XCTAssertEqual(alpha1, alpha2)

        color1 = PCColor(red: 2, green: 4, blue: 5)
        color2 = PCColor(red: 2.0 / 255.0, green: 4.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0)
        color1?.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
        XCTAssertEqual(r1, r2)
        XCTAssertEqual(g1, g2)
        XCTAssertEqual(b1, b2)
        XCTAssertEqual(alpha1, alpha2)
    }
    
}

// swiftlint:enable function_body_length
