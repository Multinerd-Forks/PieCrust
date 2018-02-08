//
//  CarInfoView.swift
//  Example
//
//  Created by Omar Albeik on 8.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import iOSAppSkeleton

class CarInfoView: View {

	var car: Car! {
		didSet {
			imageView.image = car.image
			modelLabel.text = car.model
			makeLabel.text = car.make
		}
	}

	lazy var imageView: ImageView = {
		return ImageView()
	}()

	lazy var modelLabel: Label = {
		return Label(text: "Model", textAlignment: .center, numberOfLines: 0, font: .systemFont(ofSize: 35, weight: .bold))
	}()

	lazy var makeLabel: Label = {
		return Label(text: "Make", textAlignment: .center, font: .systemFont(ofSize: 25))
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
			make.top.equalTo(modelLabel.snp.bottom).offset(preferredPadding)
			make.leading.equalToSuperview().inset(preferredPadding)
			make.trailing.equalToSuperview().inset(preferredPadding)
		}

	}

}
