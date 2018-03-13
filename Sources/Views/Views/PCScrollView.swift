//
//  PCScrollView.swift
//  PieCrust
//
//  Created by Omar Albeik on 13.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCScrollView.
///
/// - Conforms to:
///   - PCrustable
///   - PCLayoutable
///   - PCKeyboardControllable
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
class PCScrollView: UIScrollView, PCrustable, PCLayoutable, PCKeyboardControllable, PCAnimatable, PCBorderable, PCShadowable {

    /// Initializes and returns a newly allocated scroll-view object with the specified frame rectangle.
    ///
    /// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
    override public init(frame: CGRect) {
        super.init(frame: frame)

        setViews()
        layoutViews()
    }

    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameter aDecoder: An unarchiver object.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setViews()
        layoutViews()
    }

    /// Use this method to set and add your custom views.
    open func setViews() {
        backgroundColor = PCColor.white
    }

    /// Use this method to layout your custom views using SnapKit.
    open func layoutViews() {}

    /// Call this method from view contoller to handle KeyboardWillShow notification.
    ///
    /// - Parameter notification: keyboard notificaton sent from system.
    open func handleKeyboardWillShow(_ notification: Notification) {}

    /// Call this method from view contoller to handle handleKeyboardDidShow notification.
    ///
    /// - Parameter notification: keyboard notificaton sent from system.
    open func handleKeyboardDidShow(_ notification: Notification) {}

    /// Call this method from view contoller to handle handleKeyboardWillHide notification.
    ///
    /// - Parameter notification: keyboard notificaton sent from system.
    open func handleKeyboardWillHide(_ notification: Notification) {}

    /// Call this method from view contoller to handle handleKeyboardDidHide notification.
    ///
    /// - Parameter notification: keyboard notificaton sent from system.
    open func handleKeyboardDidHide(_ notification: Notification) {}

    /// Call this method from view contoller to handle handleKeyboardWillChangeFrame notification.
    ///
    /// - Parameter notification: keyboard notificaton sent from system.
    open func handleKeyboardWillChangeFrame(_ notification: Notification) {}

    /// Call this method from view contoller to handle handleKeyboardDidChangeFrame notification.
    ///
    /// - Parameter notification: keyboard notificaton sent from system.
    open func handleKeyboardDidChangeFrame(_ notification: Notification) {}

}
