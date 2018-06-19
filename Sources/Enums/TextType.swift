//
//  TextType.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// Text type is used with UIKit elements that has both text and attributedText properties.
///
/// - plain: String.
/// - attributed: NSAttributedString.
/// - empty: Empty string.
public enum TextType {
	/// String.
	case plain(String)
	/// NSAttributedString.
	case attributed(NSAttributedString)
	/// Empty string.
	case empty
}
