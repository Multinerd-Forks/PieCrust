//
//  AuthView.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 20.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class AuthView: PCView {

    private let textFieldsBackgroundColor = UIColor.gray.withAlphaComponent(0.2)

    lazy var emailTextField: PCTextField = {
        var textField = PCTextField(placeholder: "Email Address", textAlignment: .center, textType: .emailAddress, backgroundColor: textFieldsBackgroundColor)
        textField.cornerRadius = 8
        return textField
    }()

    lazy var passwordTextField: PCTextField = {
        var textField = PCTextField(placeholder: "Password", textAlignment: .center, textType: .password, backgroundColor: textFieldsBackgroundColor)
        textField.cornerRadius = 8
        return textField
    }()

    lazy var loginButton: PCLoadingButton = {
		var button = PCLoadingButton(title: "Login", backgroundColor: .black, tintColor: .white, activityIndicatorTintColor: .white)
        button.cornerRadius = 8
        return button
    }()

    private lazy var stackView: PCStackView = {
        return PCStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton], axis: .vertical, spacing: 8.0)
    }()

    private lazy var versionLabel: PCAppVersionLabel = {
        return PCAppVersionLabel()
    }()

    override func setViews() {
        super.setViews()

        addSubview(stackView)
        addSubview(versionLabel)
    }

    override func layoutViews() {
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(emailTextField.preferredHeight)
        }

        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(passwordTextField.preferredHeight)
        }

        loginButton.snp.makeConstraints { make in
            make.height.equalTo(loginButton.preferredHeight)
        }

        centerStackView()

        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(preferredPadding)
            make.centerX.equalToSuperview()
        }
    }

    override func handleKeyboardWillShow(_ notification: Notification) {
        stackView.snp.removeConstraints()
        topAnchorStackView()

        let duration  = notification.keyboardAnimationDuration ?? 0.25
        UIView.animate(withDuration: duration) {
            self.layoutIfNeeded()
        }
    }

    override func handleKeyboardWillHide(_ notification: Notification) {
        stackView.snp.removeConstraints()
        centerStackView()

        let duration  = notification.keyboardAnimationDuration ?? 0.25
        UIView.animate(withDuration: duration) {
            self.layoutIfNeeded()
        }
    }

}

// MARK: - Layout helpers
private extension AuthView {

    func centerStackView() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(preferredPadding * 2)
            make.trailing.equalToSuperview().inset(preferredPadding * 2)
            make.centerY.equalToSuperview().offset(-preferredPadding * 2)
        }
    }

    func topAnchorStackView() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(preferredPadding * 2)
            make.trailing.equalToSuperview().inset(preferredPadding * 2)
            make.top.equalToSuperview().inset(preferredPadding)
        }
    }

}
