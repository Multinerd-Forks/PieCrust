//
//  PCColor.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCColor.
///
/// - Conforms to:
///   - `Crustable`
open class PCColor: UIColor, Crustable {}

// MARK: - Default implementation for UIColor.
public extension Crustable where Self: UIColor {

	/// Create Color from RGB values with optional transparency.
	///
	/// - Parameters:
	///   - red: red component.
	///   - green: green component.
	///   - blue: blue component.
	///   - transparency: optional transparency value _(default is 1.0)_.
	public init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1.0) {
		guard red >= 0 else { return nil }
		guard red <= 255 else { return nil }

		guard green >= 0 else { return nil }
		guard green <= 255 else { return nil }

		guard blue >= 0 else { return nil }
		guard blue <= 255 else { return nil }

		var trans = transparency
		if trans < 0 { trans = 0 }
		if trans > 1 { trans = 1 }

		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
	}

	/// Create Color from hexadecimal value with optional transparency.
	///
	/// - Parameters:
	///   - hex: hex Int (example: 0xDECEB5).
	///   - transparency: optional transparency value _(default is 1.0)_.
	public init?(hex: Int, transparency: CGFloat = 1.0) {
		var trans = transparency
		if trans < 0 { trans = 0 }
		if trans > 1 { trans = 1 }

		let red = (hex >> 16) & 0xff
		let green = (hex >> 8) & 0xff
		let blue = hex & 0xff
		self.init(red: red, green: green, blue: blue, transparency: trans)
	}

	/// Create Color from hexadecimal string with optional transparency (if applicable).
	///
	/// - Parameters:
	///   - hexString: hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
	///   - transparency: optional transparency value _(default is 1.0)_.
	public init?(hexString: String, transparency: CGFloat = 1.0) {
		var string = ""
		if hexString.lowercased().hasPrefix("0x") {
			string =  hexString.replacingOccurrences(of: "0x", with: "")
		} else if hexString.hasPrefix("#") {
			string = hexString.replacingOccurrences(of: "#", with: "")
		} else {
			string = hexString
		}

		if string.count == 3 { // convert hex to 6 digit format if in short format
			var str = ""
			string.forEach { str.append(String(repeating: String($0), count: 2)) }
			string = str
		}

		guard let hexValue = Int(string, radix: 16) else { return nil }

		var trans = transparency
		if trans < 0 { trans = 0 }
		if trans > 1 { trans = 1 }

		let red = (hexValue >> 16) & 0xff
		let green = (hexValue >> 8) & 0xff
		let blue = hexValue & 0xff
		self.init(red: red, green: green, blue: blue, transparency: trans)
	}

	// swiftlint:disable next large_tuple
	/// RGB components for a Color (between 0 and 255).
	///
	///        PCColor.red.rgbComponents.red -> 255
	///        PCColor.green.rgbComponents.green -> 255
	///        PCColor.blue.rgbComponents.blue -> 255
	///
	public var rgbComponents: (red: Int, green: Int, blue: Int) {
		var components: [CGFloat] {
			let comps = cgColor.components!
			if comps.count == 4 {
				return comps
			}
			return [comps[0], comps[0], comps[0], comps[1]]
		}
		let red = components[0]
		let green = components[1]
		let blue = components[2]
		return (red: Int(red * 255.0), green: Int(green * 255.0), blue: Int(blue * 255.0))
	}

	/// Alpha of Color.
	public var alpha: CGFloat {
		return cgColor.alpha
	}

}
