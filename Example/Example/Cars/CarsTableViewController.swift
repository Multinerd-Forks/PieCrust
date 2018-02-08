//
//  CarsTableViewController.swift
//  Example
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import iOSAppSkeleton

class CarsTableViewController: GenericTableController<CarTableViewCell, Car> {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		items = Car.cars
		tableView.reloadData()
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return Car.makes[section]
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let car = items[indexPath.section][indexPath.row]

		let infoVC = CarInfoViewController(car: car)
		navigationController?.pushViewController(infoVC, animated: true)
	}
	
}
