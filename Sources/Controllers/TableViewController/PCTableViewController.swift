//
//  PCTableViewController.swift
//  PieCrust
//
//  Created by Omar Albeik on 7.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCTableViewController.
///
/// - Conforms to:
///   - PCrustable
///   - PCKeyboardObservable
///   - PCAlertable
open class PCTableViewController: UITableViewController, PCrustable, PCKeyboardObservable, PCAlertable {

    /// Initializes a table-view controller to manage a table view of a given style.
    ///
    /// - Parameter style: A constant that specifies the style of table view that the controller object is to manage.
    public override init(style: UITableViewStyle) {
        super.init(style: style)

        setTabBarItem()
    }

	/// Returns a newly initialized view controller with the nib file in the specified bundle.
	///
	/// - Parameters:
	///   - nibNameOrNil: The name of the nib file to associate with the view controller. The nib file name should not contain any leading path information. If you specify nil, the nibName property is set to nil.
	///   - nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory. If this parameter is nil, the method uses the heuristics described below to locate the nib file.
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setTabBarItem()
    }

	/// Returns an object initialized from data in a given unarchiver.
	///
	/// - Parameter aDecoder: An unarchiver object.
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
		
        setGestureRecognizers()
        becomeFirstResponder()
    }

    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    ///
    /// - Parameter animated: If true, the view is being added to the window using an animation.
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationItem()
    }

    /// Returns a Boolean value indicating whether this viwe controller can become the first responder.
    override open var canBecomeFirstResponder: Bool {
        return true
    }

    /// Set tab bar item here.
    open func setTabBarItem() {}
    
    /// Set navigation item here.
    open func setNavigationItem() {}

    /// Set gesture recognizers here.
    open func setGestureRecognizers() {}

    /// Set to true to end editing on tap.
    open var shouldEndEditingOnTap: Bool {
        return false
    }

	/// Called when .UIKeyboardWillShow notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardWillShow notification.
	open func keyboardWillShow(_ notification: Notification) {}

	/// Called when .UIKeyboardDidShow notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardDidShow notification.
	open func keyboardDidShow(_ notification: Notification) {}

	/// Called when .UIKeyboardWillHide notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardWillHide notification.
	open func keyboardWillHide(_ notification: Notification) {}

	/// Called when .UIKeyboardDidHide notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardDidHide notification.
	open func keyboardDidHide(_ notification: Notification) {}

	/// Called when .UIKeyboardWillChangeFrame notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardWillChangeFrame notification.
	open func keyboardWillChangeFrame(_ notification: Notification) {}

	/// Called when .UIKeyboardDidChangeFrame notification is prodcasted by system.
	///
	/// - Parameter notification: .UIKeyboardDidChangeFrame notification.
	open func keyboardDidChangeFrame(_ notification: Notification) {}

}

// MARK: - Private methods.
fileprivate extension PCTableViewController {

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func setTapToEndEditing() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }

}
