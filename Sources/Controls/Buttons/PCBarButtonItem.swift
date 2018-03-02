//
//  PCBarButtonItem.swift
//  PieCrust
//
//  Created by Omar Albeik on 7.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCBarButtonItem.
open class PCBarButtonItem: UIBarButtonItem {

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

        label.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(label.snp.height)
        }

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

    public var badgeBackgroundColor: UIColor = PCColor.red {
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

    public convenience init(button: UIButton, badgeText: String? = nil, target: AnyObject?, action: Selector) {
        self.init(customView: button)

        self.badgeText = badgeText

        button.addTarget(target, action: action, for: .touchUpInside)
        button.sizeToFit()
        button.addSubview(badgeLabel)

        button.snp.makeConstraints { make in
            if button.currentTitle?.isEmpty == false {
                make.bottom.equalTo(badgeLabel.snp.top)
            } else {
                make.centerY.equalTo(badgeLabel).offset(8)
            }
            make.trailing.equalTo(badgeLabel.snp.centerX).offset(8)
        }

    }

	/// Add Target to PCBarButtonItem
	///
	/// - Parameters:
	///   - target: target.
	///   - action: selector to run when button is tapped.
	public func addTargetForAction(_ target: AnyObject, action: Selector) {
		self.target = target
		self.action = action
	}

}
