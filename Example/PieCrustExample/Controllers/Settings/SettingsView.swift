//
//  SettingsView.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 21.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class SettingsView: PCView {

    var user: User? {
        didSet {
            profileImageView.image = user?.photo
            nameLabel.text = user?.name
            emailLabel.text = user?.email
        }
    }

    lazy var profileImageView: PCRoundedImageView = {
        return PCRoundedImageView()
    }()

    lazy var nameLabel: PCLabel = {
        return PCLabel(text: "Name", textAlignment: .center, numberOfLines: 2, font: .systemFont(ofSize: 24, weight: .bold))
    }()

    lazy var emailLabel: PCLabel = {
        return PCLabel(text: "Email", textAlignment: .center, numberOfLines: 1, textColor: PCColor(hex: 0x6B6B6B), minimumScaleFactor: 0.5)
    }()

    lazy var stackView: PCStackView = {
        return [nameLabel, emailLabel].stacked(axis: .vertical, spacing: 2)
    }()

    private lazy var versionLabel: PCAppVersionLabel = {
        return PCAppVersionLabel()
    }()

    override func setViews() {
        super.setViews()

        addSubview(profileImageView)
        addSubview(stackView)

        addSubview(versionLabel)
    }

    override func layoutViews() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(preferredPadding)
            make.centerX.equalToSuperview()
            make.width.equalTo(100.0)
            make.height.equalTo(100.0)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(preferredPadding)
            make.leading.equalToSuperview().inset(preferredPadding)
            make.trailing.equalToSuperview().inset(preferredPadding)
        }

        versionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(preferredPadding)
        }
    }

}
