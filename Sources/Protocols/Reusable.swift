//
//  Reusable.swift
//  PieCrust
//
//  Created by Omar Albeik on 8/6/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// Conform to `Reusable` in reusable objects.
public protocol Reusable {

	/// Reuse identifier
	static var reuseIdentifier: String { get }

}
