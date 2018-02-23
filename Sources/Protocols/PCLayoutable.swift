//
//  PCLayoutable.swift
//  PieCrust
//
//  Created by Omar Albeik on 23.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// Conform to PCLayoutable protocol to set and layout subviews in your view.
public protocol PCLayoutable {

    /// Use this method to set and add your custom views.
    func setViews()

    /// Use this method to layout your custom views using SnapKit.
    func layoutViews()

}
