//
//  PCSegmentedControl.swift
//  PieCrust
//
//  Created by Omar Albeik on 5.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// PCSegmentedControl.
///
/// - Conforms to:
///   - PCAnimatable
///   - PCBorderable
///   - PCShadowable
open class PCSegmentedControl: UISegmentedControl, PCAnimatable, PCBorderable, PCShadowable {

	/// Create segmented control and set its segment titles in one line.
	///
	/// - Parameters:
	///   - frame: The segmented control frame (default is .zero).
    ///   - segmentTitles: segmented control segment titles.
    ///   - backgroundColor: The text field's background color (default is PCColor.white).
    ///   - tintColor: The tint color of the text field (default is nil).
    ///   - isEnabled: The enabled state to use when drawing the segmented control (default is true).
    ///   - alpha: Alpha of the segmented control (default is 1.0).
	public convenience init(
        frame: CGRect = .zero,
        segmentTitles: [String],
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        isEnabled: Bool = true,
        alpha: CGFloat = 0.0) {

		self.init(frame: frame)

		self.segmentTitles = segmentTitles
        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.isEnabled = isEnabled
        self.alpha = alpha
	}

	/// Create segmented control and set its segment images in one line.
	///
	/// - Parameters:
	///   - frame: segmented control frame (default is .zero).
	///   - segmentImages: segmented control segment images.
    ///   - backgroundColor: The text field's background color (default is PCColor.white).
    ///   - tintColor: The tint color of the text field (default is nil).
    ///   - isEnabled: The enabled state to use when drawing the segmented control (default is true).
    ///   - alpha: Alpha of the segmented control (default is 1.0).
	public convenience init(
        frame: CGRect = .zero,
        segmentImages: [UIImage],
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        isEnabled: Bool = true,
        alpha: CGFloat = 0.0) {

		self.init(frame: frame)

		self.segmentImages = segmentImages
        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.isEnabled = isEnabled
        self.alpha = alpha
	}

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
	open var preferredHeight: CGFloat {
		return UIScreen.main.isSmall ? 40.0 : 48.0
	}

	/// Segments titles.
	open var segmentTitles: [String] {
		get {
			let range = 0..<numberOfSegments
			return range.flatMap { titleForSegment(at: $0) }
		}
		set {
			removeAllSegments()
			for (index, title) in newValue.enumerated() {
				insertSegment(withTitle: title, at: index, animated: false)
			}
		}
	}

	/// Segments images.
	open var segmentImages: [UIImage] {
		get {
			let range = 0..<numberOfSegments
			return range.flatMap { imageForSegment(at: $0) }
		}
		set {
			removeAllSegments()
			for (index, image) in newValue.enumerated() {
				insertSegment(with: image, at: index, animated: false)
			}
		}
	}

}
