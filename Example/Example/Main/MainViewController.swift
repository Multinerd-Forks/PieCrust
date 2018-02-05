//
//  MainViewController.swift
//  Example
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import iOSAppSkeleton

class MainViewController: ViewController {
	
	override var shouldObserveKeyboardEvents: Bool {
		return true
	}
	
	override var shouldEndEditingOnTap: Bool {
		return true
	}
	
	override func loadView() {
		view = MainView()
	}
	
	var mainView: MainView {
		return view as! MainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainView.updateButton.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
	}

	override func keyboardWillShow(_ sender: Notification) {
		mainView.handleKeyboardWillShow(sender)
	}
	
	override func keyboardWillHide(_ sender: Notification) {
		mainView.handleKeyboardWillHide(sender)
	}

	@objc func didTapUpdateButton() {
		guard let name = mainView.nameTextField.trimmedText, !name.isEmpty else {
			mainView.nameTextField.shake()
			return
		}
		
		mainView.welcomeLabel.text = "Welcome \(name)!"
		mainView.nameTextField.resignFirstResponder()
		mainView.startConfetti()
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			self.mainView.stopConfetti()
		}
	}
	
}
