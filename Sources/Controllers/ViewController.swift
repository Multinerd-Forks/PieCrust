//
//  ViewController.swift
//  iOSAppSkeleton
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit

open class ViewController: UIViewController {

	override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		setTabBarItem()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setTabBarItem()
	}
	
	override open func viewDidLoad() {
		setNavigationItem()
		
		if shouldEndEditingOnTap {
			setTapToEndEditing()
		}
		
		if shouldObserveKeyboardEvents {
			addKeyboardNotificationsObservers()
		}
		
		navigationController?.interactivePopGestureRecognizer?.delegate = shouldPopinteractively ? self : nil
		navigationController?.interactivePopGestureRecognizer?.isEnabled = shouldPopinteractively
		
		setGestureRecognizers()
		becomeFirstResponder()
	}
	
	override open var canBecomeFirstResponder: Bool {
		return true
	}
	
	open func setNavigationItem() {}
	
	open func setTabBarItem() {}
	
	open func setGestureRecognizers() {}
	
	open var shouldEndEditingOnTap: Bool {
		return false
	}
	
	open var shouldPopinteractively: Bool {
		return true
	}
	
	open var shouldObserveKeyboardEvents: Bool {
		return false
	}
	
	@objc
	open func keyboardWillShow(_ sender: Notification) {}
	
	@objc
	open func keyboardDidShow(_ sender: Notification) {}
	
	@objc
	open func keyboardWillHide(_ sender: Notification) {}
	
	@objc
	open func keyboardDidHide(_ sender: Notification) {}
	
	@objc
	open func keyboardWillChangeFrame(_ sender: Notification) {}
	
	@objc
	open func keyboardDidChangeFrame(_ sender: Notification) {}

	deinit {
		if shouldObserveKeyboardEvents {
			removeKeyboardNotificationsObservers()
		}
	}
	
}

// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
	
	public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return shouldPopinteractively
	}
	
}

// MARK: - Actions
private extension ViewController {
	
	@objc
	func hideKeyboard() {
		view.endEditing(true)
	}
	
}

// MARK: - Methods
private extension ViewController {

	func setTapToEndEditing() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		view.addGestureRecognizer(tap)
	}
	
}

// MARK: - Keyboard
extension ViewController {
	
	private func addKeyboardNotificationsObservers() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: .UIKeyboardDidShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: .UIKeyboardDidHide, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: .UIKeyboardWillChangeFrame, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeFrame(_:)), name: .UIKeyboardDidChangeFrame, object: nil)
	}
	
	private func removeKeyboardNotificationsObservers() {
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidHide, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillChangeFrame, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidChangeFrame, object: nil)
	}
	
}

