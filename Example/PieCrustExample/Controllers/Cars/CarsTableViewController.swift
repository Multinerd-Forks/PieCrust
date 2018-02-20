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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = Car.cars
    }

    override func setTabBarItem() {
        tabBarItem = UITabBarItem(title: "Cars", image: #imageLiteral(resourceName: "tab_bar_cars"), selectedImage: #imageLiteral(resourceName: "tab_bar_cars"))
    }

    override func setNavigationItem() {
        navigationItem.title = "Cars"
        navigationItem.rightBarButtonItem = PCBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return Car.makes[section]
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let car = items[indexPath.section][indexPath.row]

		let infoVC = CarInfoViewController(car: car)
		navigationController?.pushViewController(infoVC, animated: true)
	}

    @objc private func didTapAddButton() {

    }

}
