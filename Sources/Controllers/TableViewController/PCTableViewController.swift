//
//  PCTableViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 7.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

/// PCTableViewController.
open class PCTableViewController: UITableViewController, PCrustable, PCAlertable {

    /// Initializes a table-view controller to manage a table view of a given style.
    public override init(style: UITableViewStyle) {
        super.init(style: style)

        setTabBarItem()
    }

    /// Returns a newly initialized view controller with the nib file in the specified bundle.
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setTabBarItem()
    }

    /// Returns a PCTableViewController object initialized from data in a given unarchiver.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setTabBarItem()
    }

    /// Called after the controller's view is loaded into memory.
    override open func viewDidLoad() {
        super.viewDidLoad()

        if shouldEndEditingOnTap {
            setTapToEndEditing()
        }

        if shouldObserveKeyboardEvents {
            addKeyboardNotificationsObservers()
        }

        setGestureRecognizers()
        becomeFirstResponder()
    }

    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationItem()
    }

    /// Returns a Boolean value indicating whether this viwe controller can become the first responder.
    override open var canBecomeFirstResponder: Bool {
        return true
    }

    /// Set navigation item here.
    open func setNavigationItem() {}

    /// Set tab bar item here.
    open func setTabBarItem() {}

    /// Set gesture recognizers here.
    open func setGestureRecognizers() {}

    /// Set to true to end editing on tap.
    open var shouldEndEditingOnTap: Bool {
        return false
    }

    /// Set to true to observe keyboard events from system.
    open var shouldObserveKeyboardEvents: Bool {
        return false
    }

    /// The nearest ancestor in the view controller hierarchy that is a PCNavigationController.
    open var pcNavigationController: PCNavigationController? {
        return navigationController as? PCNavigationController
    }

    /// The nearest ancestor in the view controller hierarchy that is a PCTabBarController.
    open var pcTabBarController: PCTabBarController? {
        return tabBarController as? PCTabBarController
    }

    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardWillShow notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardWillShow notification.
    @objc open func keyboardWillShow(_ notification: Notification) {}

    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardDidShow notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardDidShow notification.
    @objc open func keyboardDidShow(_ notification: Notification) {}

    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardWillHide notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardWillHide notification.
    @objc open func keyboardWillHide(_ notification: Notification) {}

    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardDidHide notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardDidHide notification.
    @objc open func keyboardDidHide(_ notification: Notification) {}

    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardWillChangeFrame notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardWillChangeFrame notification.
    @objc open func keyboardWillChangeFrame(_ notification: Notification) {}

    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardDidChangeFrame notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardDidChangeFrame notification.
    @objc open func keyboardDidChangeFrame(_ notification: Notification) {}

    deinit {
        if shouldObserveKeyboardEvents {
            removeKeyboardNotificationsObservers()
        }
    }

}

// MARK: - Private methods.
private extension PCTableViewController {

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func setTapToEndEditing() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }

}

// MARK: - Keyboard helpers
private extension PCTableViewController {

    func addKeyboardNotificationsObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: .UIKeyboardDidHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: .UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeFrame(_:)), name: .UIKeyboardDidChangeFrame, object: nil)
    }

    func removeKeyboardNotificationsObservers() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidChangeFrame, object: nil)
    }

}
