//
//  CarTableViewCell.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 6.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import PieCrust

class CarTableViewCell: PCGenericTableViewCell<Car> {

	override var item: Car! {
		didSet {
			carImageView.image = item.image
			modelLabel.text = item.model
			yearLabel.text = "\(item.year)"
		}
	}

	lazy var carImageView: PCImageView = {
		return PCImageView()
	}()

	lazy var modelLabel: PCLabel = {
        return PCLabel(font: UIFont.systemFont(ofSize: 20, weight: .bold))
	}()

	lazy var yearLabel: PCLabel = {
		return PCLabel()
	}()

	lazy var labelsStackView: UIStackView = {
        return [modelLabel, yearLabel].stacked(axis: .vertical)
	}()

	override var preferredPadding: CGFloat {
		return 10
	}

	override func setViews() {
		super.setViews()

		separatorInset = .init(top: 0, left: 100, bottom: 0, right: 0)
		addSubview(carImageView)
		addSubview(labelsStackView)
	}

	override func layoutViews() {
		carImageView.snp.makeConstraints { make in
			make.leading.equalToSuperview().inset(preferredPadding)
			make.top.equalToSuperview().inset(preferredPadding)
			make.bottom.equalToSuperview().inset(preferredPadding)
			make.height.equalTo(80)
			make.width.equalTo(80)
		}

		labelsStackView.snp.makeConstraints { make in
			make.leading.equalTo(carImageView.snp.trailing).offset(preferredPadding)
			make.centerY.equalToSuperview()
			make.trailing.equalToSuperview().inset(preferredPadding)
		}

	}

	override var isHighlighted: Bool {
		didSet {
			isHighlighted ? carImageView.popIn() : carImageView.popOut()
		}
	}

}
