//
//  PCTabBarController.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTabBarController.
///
/// - Conforms to:
///   - `Crustable`
open class PCTabBarController: UITabBarController, Crustable {}

// MARK: - Default implementation for UITabBarController.
public extension Crustable where Self: UITabBarController {}
