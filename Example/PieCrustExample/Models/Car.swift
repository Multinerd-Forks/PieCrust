//
//  Car.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

struct Car {
	
	var model: String
	var make: String
	var year: Int
	var image: UIImage?
	
}

// MARK: - List
extension Car {

	private static let tesla = [
		Car(model: "Model S", make: "Tesla", year: 2018, image: #imageLiteral(resourceName: "Model S")),
		Car(model: "Model X", make: "Tesla", year: 2016, image: #imageLiteral(resourceName: "Model X")),
		Car(model: "Model 3", make: "Tesla", year: 2017, image: #imageLiteral(resourceName: "Model 3")),
		Car(model: "Roadster", make: "Tesla", year: 2018, image: #imageLiteral(resourceName: "Roadster"))
	]
	
	private static let benz = [
		Car(model: "SLS AMG", make: "Mercedes-Benz", year: 2012, image: #imageLiteral(resourceName: "SLS-AMG")),
		Car(model: "CLA-Class", make: "Mercedes-Benz", year: 2017, image: #imageLiteral(resourceName: "CLA-Class")),
		Car(model: "SL-Class", make: "Mercedes-Benz", year: 2015, image: #imageLiteral(resourceName: "SL-Class"))
	]
	
	static var cars = [tesla, benz]
	
}
