//
//  PCLoadingable.swift
//  PieCrust
//
//  Created by Omar Albeik on 3/4/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// Confirm to PCLoadingable protocol if your class has a loading state.
public protocol PCLoadingable: class {

    /// Whether your class is loading or not.
	var isLoading: Bool { get set }
    
}
