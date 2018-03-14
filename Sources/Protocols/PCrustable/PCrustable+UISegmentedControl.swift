//
//  PCrustable+UISegmentedControl.swift
//  PieCrust
//
//  Created by Omar Albeik on 6.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UISegmentedControl
public extension PCrustable where Self: UISegmentedControl {

    /// Creates and returns a new UISegmentedControl with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - frame: The segmented control frame _(default is .zero)_.
    ///   - segmentTitles: segmented control segment titles.
    ///   - isEnabled: The enabled state to use when drawing the segmented control _(default is true)_.
    ///   - backgroundColor: The text field's background color _(default is PCColor.white)_.
    ///   - tintColor: The tint color of the text field _(default is nil)_.
    ///   - alpha: Alpha of the segmented control _(default is 1.0)_.
    public init(
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
    ///   - frame: segmented control frame _(default is .zero)_.
    ///   - segmentImages: segmented control segment images.
    ///   - isEnabled: The enabled state to use when drawing the segmented control _(default is true)_.
    ///   - backgroundColor: The text field's background color _(default is PCColor.white)_.
    ///   - tintColor: The tint color of the text field _(default is nil)_.
    ///   - alpha: Alpha of the segmented control _(default is 1.0)_.
    public init(
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

    /// Preferred height for autolayout _(default is 40.0 for iPhone SE screen sizes and 48.0 for others)_.
    /// Override this value by setting _preferredHeight_ in `PCConstants` to change it app-wide, or just here to set it for this segmented control only.
    public var preferredHeight: CGFloat {
        return PCConstants.preferredHeight
    }

    /// Segments titles.
    public var segmentTitles: [String] {
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
    public var segmentImages: [UIImage] {
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
