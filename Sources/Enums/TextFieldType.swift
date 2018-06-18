//
//  TextFieldType.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// TextField text type.
///
/// - generic: TextField is used to enter generic text.
/// - emailAddress: TextField is used to enter email addresses.
/// - url: TextField is used to enter URLs.
/// - phoneNumber: TextField is used to enter phone numbers.
/// - decimal: TextField is used to enter decimal numbers.
/// - password: TextField is used to enter passwords.
public enum TextFieldType {
	/// TextField is used to enter generic text.
	case generic
	/// TextField is used to enter email addresses.
	case emailAddress
	/// TextField is used to enter URLs.
	case url
	/// TextField is used to enter phone numbers.
	case phoneNumber
	/// TextField is used to enter decimal numbers.
	case decimal
	/// TextField is used to enter passwords.
	case password
}
