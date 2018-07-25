//
//  PCBadgeBarButtonItem.swift
//  PieCrust
//
//  Created by Omar Albeik on 7/20/18.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

open class PCBadgeBarButtonItem: UIBarButtonItem {

	public convenience init(image: UIImage, badgeText: String? = nil, target: AnyObject?, action: Selector) {
		let button = UIButton(type: .custom)
		button.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
		button.setBackgroundImage(image, for: .normal)

		self.init(button: button, badgeText: badgeText, target: target, action: action)
	}

	public convenience init(title: String, badgeText: String? = nil, target: AnyObject?, action: Selector) {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)

		self.init(button: button, badgeText: badgeText, target: target, action: action)
	}

	private (set) lazy var badgeLabel: UILabel = {
		let label = UILabel()
		label.text = badgeText?.isEmpty == false ? " \(badgeText!) " : nil
		label.isHidden = badgeText?.isEmpty != false
		label.textColor = badgeFontColor
		label.backgroundColor = badgeBackgroundColor

		label.font = .systemFont(ofSize: badgeFontSize)
		label.layer.cornerRadius = badgeFontSize * 0.6
		label.clipsToBounds = true

		label.translatesAutoresizingMaskIntoConstraints = false
		label.widthAnchor.constraint(greaterThanOrEqualTo: label.heightAnchor).isActive = true

		return label
	}()

	public var badgeButton: UIButton? {
		return customView as? UIButton
	}

	public var badgeText: String? {
		didSet {
			badgeLabel.text = badgeText?.isEmpty == false ? " \(badgeText!) " : nil
			badgeLabel.isHidden = badgeText?.isEmpty != false
			badgeLabel.sizeToFit()
		}
	}

	public var badgeBackgroundColor: UIColor = .red {
		didSet {
			badgeLabel.backgroundColor = badgeBackgroundColor
		}
	}

	public var badgeFontColor: UIColor = .white {
		didSet {
			badgeLabel.textColor = badgeFontColor
		}
	}

	public var badgeFontSize: CGFloat = UIFont.smallSystemFontSize {
		didSet {
			badgeLabel.font = .systemFont(ofSize: badgeFontSize)
			badgeLabel.layer.cornerRadius = badgeFontSize * 0.6
			badgeLabel.sizeToFit()
		}
	}

}

// MARK: - Helpers
private extension PCBadgeBarButtonItem {

	private convenience init(button: UIButton, badgeText: String? = nil, target: AnyObject?, action: Selector) {
		self.init(customView: button)

		self.badgeText = badgeText

		button.addTarget(target, action: action, for: .touchUpInside)
		button.sizeToFit()
		button.addSubview(badgeLabel)

		if button.currentTitle?.isEmpty == false {
			button.bottomAnchor.constraint(equalTo: badgeLabel.topAnchor).isActive = true
		} else {
			button.centerYAnchor.constraint(equalTo: badgeLabel.centerYAnchor, constant: 8).isActive = true
		}
		button.trailingAnchor.constraint(equalTo: badgeLabel.centerXAnchor, constant: 8).isActive = true
	}

}
