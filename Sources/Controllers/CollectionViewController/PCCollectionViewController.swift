//
//  PCCollectionViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 9.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

/// PCCollectionViewController.
open class PCCollectionViewController: UICollectionViewController {

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setTabBarItem()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setTabBarItem()
    }

    override open func viewDidLoad() {
		super.viewDidLoad()

        setNavigationItem()

        if shouldEndEditingOnTap {
            setTapToEndEditing()
        }

        if shouldObserveKeyboardEvents {
            addKeyboardNotificationsObservers()
        }

        setGestureRecognizers()
        becomeFirstResponder()
    }

    override open var canBecomeFirstResponder: Bool {
        return true
    }

    /// Set navigation item here.
    open func setNavigationItem() {}

    /// Set tab bar item here.
    open func setTabBarItem() {}

    /// Set gesture recognizers here.
    open func setGestureRecognizers() {}

    open var shouldEndEditingOnTap: Bool {
        return false
    }

    /// Set to true to observe keyboard events from system.
    open var shouldObserveKeyboardEvents: Bool {
        return false
    }

    /// controller's PCNavigationController (if applicable)
    open var pcNavigationController: PCNavigationController? {
        return navigationController as? PCNavigationController
    }

    /// controller's PCTabBarController (if applicable)
    open var pcTabBarController: PCTabBarController? {
        return tabBarController as? PCTabBarController
    }

    @objc
    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardWillShow notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardWillShow notification.
    open func keyboardWillShow(_ notification: Notification) {}

    @objc
    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardDidShow notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardDidShow notification.
    open func keyboardDidShow(_ notification: Notification) {}

    @objc
    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardWillHide notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardWillHide notification.
    open func keyboardWillHide(_ notification: Notification) {}

    @objc
    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardDidHide notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardDidHide notification.
    open func keyboardDidHide(_ notification: Notification) {}

    @objc
    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardWillChangeFrame notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardWillChangeFrame notification.
    open func keyboardWillChangeFrame(_ notification: Notification) {}

    @objc
    /// Called when shouldObserveKeyboardEvents is true and .UIKeyboardDidChangeFrame notification is prodcasted by system.
    ///
    /// - Parameter notification: .UIKeyboardDidChangeFrame notification.
    open func keyboardDidChangeFrame(_ notification: Notification) {}

    deinit {
        if shouldObserveKeyboardEvents {
            removeKeyboardNotificationsObservers()
        }
    }

}

// MARK: - Private actions
private extension PCCollectionViewController {

    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }

}

// MARK: - Private methods
private extension PCCollectionViewController {

    func setTapToEndEditing() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }

}

// MARK: - Keyboard helpers
private extension PCCollectionViewController {

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
