//
//  MainViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class MainViewController: PCViewController {

    override var shouldObserveKeyboardEvents: Bool {
        return true
    }

    override func loadView() {
        view = MainView()
    }

    var mainView: MainView {
        return view as! MainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.showCarListButton.addTarget(self, action: #selector(didTapShowCarListButton(sender:)), for: .touchUpInside)
    }

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

