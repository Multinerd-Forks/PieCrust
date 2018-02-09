//
//  CarsTableViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class CarsTableViewController: PCGenericTableController<CarTableViewCell, Car> {

    override var items: [[Car]] {
        didSet {
            tableView.reloadData()
        }
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return Car.makes[section]
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let car = items[indexPath.section][indexPath.row]

		let infoVC = CarInfoViewController(item: car)
		navigationController?.pushViewController(infoVC, animated: true)
	}
	
}
