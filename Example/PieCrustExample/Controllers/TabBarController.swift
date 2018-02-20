//
//  TabBarController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 20.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class TabBarController: PCTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            NavigationController(rootViewController: HomeViewController()),
            NavigationController(rootViewController: CarsTableViewController()),
            NavigationController(rootViewController: SettingsViewController())
        ]
    }

}
