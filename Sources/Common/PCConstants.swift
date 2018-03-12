//
//  PCConstants.swift
//  PieCrust
//
//  Created by Omar Albeik on 2.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SwifterSwift

open class PCConstants {

    /// Preferred padding for autolayout (default is 20).
    /// Override this value here to change it app-wide.
    open static var preferredPadding: CGFloat = 20.0

    /// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
    /// Override this value here to change it app-wide.
    open static var preferredHeight: CGFloat = UIScreen.main.isSmall ? 40.0 : 48.0

}
