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
		self.carInfoView.car = car
	}

	var car: Car! {
		didSet {
			navigationItem.title = car.model
			carInfoView.car = car
		}
	}

	override func loadView() {
		view = CarInfoView()
	}

	var carInfoView: CarInfoView {
		return view as! CarInfoView
	}

}
