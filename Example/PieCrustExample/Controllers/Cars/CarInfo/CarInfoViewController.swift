//
//  CarInfoViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class CarInfoViewController: PCViewController {

	convenience init(car: Car) {
		self.init()

		self.car = car
	}

	var car: Car!

	override func loadView() {
		view = CarInfoView()
	}

	override var pcView: CarInfoView {
		return view as! CarInfoView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		edgesForExtendedLayout = []
		pcView.car = car
	}

	override func setNavigationItem() {
		navigationItem.title = car.model
	}

}
