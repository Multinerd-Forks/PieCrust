//
//  MainView.swift
//  Example
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import iOSAppSkeleton

class MainView: View {
	
	override var showsConfetti: Bool {
		return true
	}
	
	let nameTextField: TextField = {
		var tf = TextField(placeholder: "Enter your name here :)", backgroundColor: UIColor.gray.withAlphaComponent(0.2))
		tf.cornerRadius = 8
		return tf
	}()
	
	let updateButton: Button = {
		var button = Button(title: "Update!", backgroundColor: .gray)
		button.cornerRadius = 8
		return button
	}()
	
	let welcomeLabel: Label = {
		let label = Label(textAlignment: .center, numberOfLines: 0)
		label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
		return label
	}()
	
	override func setViews() {
		super.setViews()
		
		addSubview(nameTextField)
		addSubview(updateButton)
		addSubview(welcomeLabel)
	}
	
	override func layoutViews() {
		super.layoutViews()
		
		nameTextField.snp.makeConstraints { make in
			make.top.equalToSuperview().inset(200)
			make.leading.equalToSuperview().inset(preferredPadding)
			make.trailing.equalToSuperview().inset(preferredPadding)
			make.height.equalTo(nameTextField.preferredHeight)
		}
		
		updateButton.snp.makeConstraints { make in
			make.top.equalTo(nameTextField.snp.bottom).offset(preferredPadding)
			make.centerX.equalToSuperview()
			make.height.equalTo(updateButton.preferredHeight)
		}
		
		welcomeLabel.snp.makeConstraints { make in
			make.top.equalTo(updateButton.snp.bottom).offset(preferredPadding * 2)
			make.leading.equalToSuperview().inset(preferredPadding)
			make.trailing.equalToSuperview().inset(preferredPadding)
		}
	}
	
	override func handleKeyboardWillShow(_ sender: Notification) {
		nameTextField.snp.updateConstraints { make in
			make.top.equalToSuperview().inset(preferredPadding * 2)
		}
		
		UIView.animate(withDuration: sender.keyboardAnimationDuration ?? 0.25) {
			self.layoutIfNeeded()
		}
	}
	
	override func handleKeyboardWillHide(_ sender: Notification) {
		nameTextField.snp.updateConstraints { make in
			make.top.equalToSuperview().inset(200)
		}
		
		UIView.animate(withDuration: sender.keyboardAnimationDuration ?? 0.25) {
			self.layoutIfNeeded()
		}
	}
	
}
