//
//  PCrustable+UIActivityIndicatorView.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

public extension PCrustable where Self: UIActivityIndicatorView {

    /// Creates and returns a new UIActivityIndicatorView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - activityIndicatorStyle: The basic appearance of the activity indicator _(default is .white)_.
    ///   - hidesWhenStopped: A Boolean value that controls whether the receiver is hidden when the animation is stopped _(default is true)_.
    ///   - color: The color of the activity indicator.
    ///   - alpha: Activity indicator's alpha _(default is 1.0)_.
    public init(
        activityIndicatorStyle: UIActivityIndicatorViewStyle = .white,
        hidesWhenStopped: Bool = true,
        color: UIColor?,
        alpha: CGFloat = 1.0) {

        self.init(activityIndicatorStyle: activityIndicatorStyle)

        self.hidesWhenStopped = hidesWhenStopped
        self.color = color
        self.alpha = alpha
    }

}
