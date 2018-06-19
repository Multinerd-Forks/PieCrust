//
//  PCCollectionView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6/19/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

/// PCCollectionView.
///
/// - Conforms to:
///   - `Crustable`
///   - `Animatable`
///   - `Borderable`
///   - `Shadowable`
///   - `CellRegistering`
///   - `CellDiqueing`
open class PCCollectionView: UICollectionView, Crustable, Animatable, Borderable, Shadowable, CellRegistering, CellDiqueing {}
