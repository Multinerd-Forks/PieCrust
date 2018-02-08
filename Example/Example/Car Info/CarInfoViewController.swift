//
//  CarInfoViewController.swift
//  Example
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import iOSAppSkeleton

class CarInfoViewController: ViewController {

	convenience init(car: Car) {
		self.init()

		self.car = car
		self.carInfoView.car = car
	}

	var car: Car! {
		didSet {
			navigationItem.title = car.model
		}
	}

	override func loadView() {
		view = CarInfoView()
	}

	var carInfoView: CarInfoView {
		return view as! CarInfoView
	}

}
