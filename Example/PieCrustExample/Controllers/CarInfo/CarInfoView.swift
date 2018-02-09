//
//  CarInfoView.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class CarInfoView: PCGenericView<Car> {

    override var item: Car? {
        didSet {
            imageView.image = item?.image
            modelLabel.text = item?.model
            makeLabel.text = item?.make
        }
    }

    lazy var imageView: PCImageView = {
        return PCImageView()
    }()

    lazy var modelLabel: PCLabel = {
        return PCLabel(text: "Model", textAlignment: .center, numberOfLines: 0, font: .systemFont(ofSize: 35, weight: .bold))
    }()

    lazy var makeLabel: PCLabel = {
        return PCLabel(text: "Make", textAlignment: .center, font: .systemFont(ofSize: 20))
    }()

    override func setViews() {
        super.setViews()

        addSubview(imageView)
        addSubview(modelLabel)
        addSubview(makeLabel)
    }

    override func layoutViews() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(preferredPadding * 2)
            make.width.equalTo(250)
            make.height.equalTo(250)
            make.centerX.equalToSuperview()
        }

        modelLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.equalToSuperview().inset(preferredPadding)
            make.trailing.equalToSuperview().inset(preferredPadding)
        }

        makeLabel.snp.makeConstraints { make in
            make.top.equalTo(modelLabel.snp.bottom)
            make.leading.equalToSuperview().inset(preferredPadding)
            make.trailing.equalToSuperview().inset(preferredPadding)
        }

    }

}
