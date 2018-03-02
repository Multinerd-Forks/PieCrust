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
    ///   - isEnabled: The enabled state to use when drawing the segmented control (default is true).
    ///   - backgroundColor: The text field's background color (default is PCColor.white).
    ///   - tintColor: The tint color of the text field (default is nil).
    ///   - alpha: Alpha of the segmented control (default is 1.0).
	public convenience init(
        frame: CGRect = .zero,
        segmentTitles: [String],
        isEnabled: Bool = true,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 0.0) {

		self.init(frame: frame)

		self.segmentTitles = segmentTitles
        self.isEnabled = isEnabled

        self.backgroundColor = backgroundColor
        if let color = tintColor {
            self.tintColor = color
        }
        self.alpha = alpha
	}

	/// Create segmented control and set its segment images in one line.
	///
	/// - Parameters:
	///   - frame: segmented control frame (default is .zero).
	///   - segmentImages: segmented control segment images.
    ///   - isEnabled: The enabled state to use when drawing the segmented control (default is true).
    ///   - backgroundColor: The text field's background color (default is PCColor.white).
    ///   - tintColor: The tint color of the text field (default is nil).
    ///   - alpha: Alpha of the segmented control (default is 1.0).
	public convenience init(
        frame: CGRect = .zero,
        segmentImages: [UIImage],
        isEnabled: Bool = true,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 0.0) {

		self.init(frame: frame)

		self.segmentImages = segmentImages
        self.isEnabled = isEnabled

        self.backgroundColor = backgroundColor
        if let color = tintColor {
            self.tintColor = color
        }
        self.alpha = alpha
	}

	/// Preferred height for autolayout (default is 40.0 for small screens and 48.0 for other screen sizes).
    /// Override this value by setting `preferredHeight` in `PCConstants` to change it app-wide, or just here to set it for this segmented control only.
	open var preferredHeight: CGFloat {
		return PCConstants.preferredHeight
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
