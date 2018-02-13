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
	
	static let makes = ["Tesla", "Mercedes-Benz"]
	
	private static let tesla = [
		Car(model: "Model S", make: makes[0], year: 2018, image: #imageLiteral(resourceName: "Model S")),
		Car(model: "Model X", make: makes[0], year: 2016, image: #imageLiteral(resourceName: "Model X")),
		Car(model: "Model 3", make: makes[0], year: 2017, image: #imageLiteral(resourceName: "Model 3")),
		Car(model: "Roadster", make: makes[0], year: 2018, image: #imageLiteral(resourceName: "Roadster"))
	]
	
	private static let benz = [
		Car(model: "SLS AMG", make: makes[1], year: 2012, image: #imageLiteral(resourceName: "SLS-AMG")),
		Car(model: "CLA-Class", make: makes[1], year: 2017, image: #imageLiteral(resourceName: "CLA-Class")),
		Car(model: "SL-Class", make: makes[1], year: 2015, image: #imageLiteral(resourceName: "SL-Class"))
	]
	
	static let cars = [tesla, benz]
	
}
