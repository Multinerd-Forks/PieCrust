//
//  PCrustable+UISwitch.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UISwitch
public extension PCrustable where Self: UISwitch {

    /// Toggle Switch.
    ///
    /// - Parameter animated: set true to animate the change _(default is true)_.
    public func toggle(animated: Bool = true) {
        setOn(!isOn, animated: animated)
    }

}
