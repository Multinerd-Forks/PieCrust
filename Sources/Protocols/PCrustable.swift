//
//  PCrustable.swift
//  PieCrust
//
//  Created by Omar Albeik on 23.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import Foundation

/// Conform to PCrustable to set view controllers in code.
public protocol PCrustable {

    /// Set tab bar item here.
    func setTabBarItem()

    /// Set navigation item here.
    func setNavigationItem()

    /// Set gesture recognizers here.
    func setGestureRecognizers()

    /// Set Navigation Item logo image.
    func setNavigationItemLogo(_ image: UIImage, width: CGFloat, height: CGFloat)

}

extension PCrustable where Self: UIViewController {

    public func setNavigationItemLogo(_ image: UIImage, width: CGFloat = 100, height: CGFloat = 30) {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = image
        navigationItem.titleView = logoImageView
    }

}
