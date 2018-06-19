//
//  PCTableView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCTableView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
///   - `CellRegistering`
///   - `CellDiqueing`
open class PCTableView: UITableView, Crustable, Animatable, Borderable, Shadowable, CellRegistering, CellDiqueing {}
