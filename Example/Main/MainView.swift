//
//  MainView.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class MainView: PCView {

	lazy var showCarListButton: PCLoadingButton = {
		var button = PCLoadingButton(title: "Show Car List", backgroundColor: .gray, tintColor: .white)
		button.cornerRadius = 8
		return button
	}()
	
	override func setViews() {
		super.setViews()
		addSubview(showCarListButton)
	}
	
	override func layoutViews() {
		showCarListButton.snp.makeConstraints { make in
			make.center.equalToSuperview()
			make.height.equalTo(showCarListButton.preferredHeight)
		}
	}
	
}
