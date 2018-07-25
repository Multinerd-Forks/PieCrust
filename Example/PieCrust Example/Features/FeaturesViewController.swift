//
//  FeaturesViewController.swift
//  PieCrust Example
//
//  Created by Omar Albeik on 6/14/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class FeaturesViewController: PCViewController, Layouting {
	typealias View = FeaturesView

	override func loadView() {
		view = View()
	}

	override func setNavigationItem() {
		navigationItem.rightBarButtonItem = PCBadgeBarButtonItem(title: "Messages", badgeText: "1", target: self, action: #selector(didTapInboxBarButtonItem))
	}

}

// MARK: - Actions
private extension FeaturesViewController {

	@objc
	func didTapInboxBarButtonItem() {

	}

}
