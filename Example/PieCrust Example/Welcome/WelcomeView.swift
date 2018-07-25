//
//  WelcomeView.swift
//  PieCrust Example
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust
import SnapKit

final class WelcomeView: PCView {

	lazy var logoImageView: PCImageView = {
		return PCImageView(image: #imageLiteral(resourceName: "welcome_logo"), contentMode: .scaleAspectFit)
	}()

	lazy var startButton: PCButton = {
		var button = PCButton(type: .system, title: .plain("Start"), titleFont: .systemFont(ofSize: 22, weight: .semibold), contentEdgeInsets: .init(top: 0, left: preferredPadding * 2.5, bottom: 0, right: preferredPadding * 2.5), backgroundColor: .brown, tintColor: .white)
		button.cornerRadius = 8
		return button
	}()

	override func setupViews() {
		super.setupViews()

		addSubview(logoImageView)
		addSubview(startButton)
	}

	override func setupLayout() {
		logoImageView.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(preferredPadding)
		}

		startButton.snp.makeConstraints { make in
			if #available(iOS 11.0, *) {
				make.bottom.equalTo(safeAreaLayoutGuide).inset(preferredPadding)
			} else {
				make.bottom.equalToSuperview().inset(preferredPadding)
			}
			make.centerX.equalToSuperview()
			make.height.equalTo(startButton.preferredHeight)
		}
	}

}

// MARK: - Helpers
extension WelcomeView {

	func hideLogoImageView() {
		logoImageView.alpha = 0
		logoImageView.transform = .init(scaleX: 0.75, y: 0.75)
	}

	func showLogoImageView() {
		logoImageView.snp.updateConstraints { make in
			make.centerY.equalToSuperview()
		}

		UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: { [unowned self] in
			self.logoImageView.transform = .identity
			self.logoImageView.alpha = 1
			self.layoutIfNeeded()
		}, completion: nil)
	}

}
