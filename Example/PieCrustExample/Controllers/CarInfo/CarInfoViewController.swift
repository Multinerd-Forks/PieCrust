//
//  CarInfoViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class CarInfoViewController: PCGenericViewController<CarInfoView, Car> {

    override func setNavigationItem() {
        navigationItem.title = item?.model
    }

}
