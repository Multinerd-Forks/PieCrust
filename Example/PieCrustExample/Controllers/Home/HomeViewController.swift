//
//  HomeViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class HomeViewController: PCViewController {

   override func loadView() {
        view = HomeView()
    }

	var pcView: HomeView {
		return view as! HomeView
	}

    override func setTabBarItem() {
        tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "tab_bar_home"), selectedImage: #imageLiteral(resourceName: "tab_bar_home"))
    }

    override func setNavigationItem() {
        navigationItem.title = "Home"
    }

}

// MARK: - Actions
private extension HomeViewController {

    @objc
    func didTapShowCarListButton(sender: PCLoadingButton) {
        sender.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.isLoading = false

            let carsVC = CarsTableViewController(items: Car.cars)
            self.navigationController?.pushViewController(carsVC, animated: true)
        }
    }

}

