//
//  PCPillButton.swift
//  PieCrust
//
//  Created by Omar Albeik on 22.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

open class PCPillButton: PCButton {

    override open var bounds: CGRect {
        didSet {
            cornerRadius = bounds.height / 2
        }
    }

}
