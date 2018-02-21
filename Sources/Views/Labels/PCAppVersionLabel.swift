//
//  PCAppVersionLabel.swift
//  PieCrust
//
//  Created by Omar Albeik on 21.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

open class PCAppVersionLabel: PCLabel {

    open var version: String? {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return nil }
        return hasVPrefeix ? "v\(appVersion)" : appVersion
    }

    open var hasVPrefeix = true

    /// Create label and set its properties in one line.
    ///
    /// - Parameters:
    ///   - hasVPrefeix: weither the string has the "v" prefix (default is true).
    public convenience init(hasVPrefeix: Bool) {
        self.init()

        self.hasVPrefeix = hasVPrefeix
        self.text = version
    }

    /// Initializes and returns a newly allocated label object with the specified frame rectangle.
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.text = version
    }

    /// Returns a PCAppVersionLabel object initialized from data in a given unarchiver.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.text = version
    }

}
