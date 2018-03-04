//
//  PCTextFieldType.swift
//  PieCrust
//
//  Created by Omar Albeik on 3/4/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// TextField text type.
///
/// - emailAddress: TextField is used to enter email addresses.
/// - emailAddress: TextField is used to enter URLs.
/// - phoneNumber: TextField is used to enter phone numbers.
/// - decimal: TextField is used to enter decimal numbers.
/// - password: TextField is used to enter passwords.
/// - generic: TextField is used to enter generic text.
public enum PCTextFieldType {
	case emailAddress
	case url
	case phoneNumber
	case decimal
	case password
	case generic
}
