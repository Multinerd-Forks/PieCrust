//
//  AuthViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 20.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class AuthViewController: PCViewController {

    override func loadView() {
        view = AuthView()
    }

    override var pcView: AuthView {
        return view as! AuthView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

		registerForKeyboardEvents()

        edgesForExtendedLayout = []
        pcView.loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }

    override var shouldEndEditingOnTap: Bool {
        return true
    }

	override func keyboardWillShow(_ notification: Notification) {
		pcView.handleKeyboardWillShow(notification)
	}

	override func keyboardWillHide(_ notification: Notification) {
		pcView.handleKeyboardWillHide(notification)
	}

	deinit {
		unregisterFromKeyboardEvents()
	}

}

// MARK: - Actions
private extension AuthViewController {

    @objc func didTapLoginButton(_ button: PCLoadingButton) {
        pcView.endEditing(true)
        button.isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            button.isLoading = false

            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.showTabController()
        }
    }

}
