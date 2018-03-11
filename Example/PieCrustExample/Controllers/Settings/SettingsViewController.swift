//
//  SettingsViewController.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 20.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class SettingsViewController: PCViewController {

    override func loadView() {
        view = SettingsView()
    }

	var pcView: SettingsView {
		return view as! SettingsView
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        
        pcView.user = User.steveJobs
    }

    override func setTabBarItem() {
        tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "tab_bar_settings"), selectedImage: #imageLiteral(resourceName: "tab_bar_settings"))
    }

    override func setNavigationItem() {
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = PCBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogoutButton))
    }

}

// MARK: - Actions
private extension SettingsViewController {

    @objc func didTapLogoutButton() {
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.showAuthController()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        presentAlert(title: "Logout?", message: "Are you sure you want to logout?", actions: [logoutAction, cancelAction])
    }

}
