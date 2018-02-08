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
	
	override func loadView() {
		view = MainView()
	}
	
	var mainView: MainView {
		return view as! MainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		mainView.showCarListButton.addTarget(self, action: #selector(didTapShowCarListButton), for: .touchUpInside)
	}
	
	@objc
	func didTapShowCarListButton() {
		customNavigationController?.showConfetti()

		let carsVC = CarsTableViewController(style: .grouped)
		navigationController?.pushViewController(carsVC, animated: true)
	}
	
}
