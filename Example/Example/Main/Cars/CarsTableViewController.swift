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
	
}
