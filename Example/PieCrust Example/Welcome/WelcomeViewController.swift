//
//  WelcomeViewController.swift
//  PieCrust Example
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

final class WelcomeViewController: UIViewController, Layouting {
	typealias View = WelcomeView

	override func loadView() {
		view = View()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		pcView.hideLogoImageView()
		pcView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		pcView.showLogoImageView()
	}

}

// MARK: - Actions
private extension WelcomeViewController {

	@objc func didTapStartButton() {
		(UIApplication.shared.delegate as! AppDelegate).showFeaturesViewController()
	}

}
