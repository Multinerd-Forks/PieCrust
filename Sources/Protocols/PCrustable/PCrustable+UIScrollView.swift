//
//  PCrustable+UIScrollView.swift
//  PieCrust
//
//  Created by Omar Albeik on 13.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

// MARK: - UIScrollView
public extension PCrustable where Self: UIScrollView {

    /// Creates and returns a new UIScrollView with setting its properties in one line.
    ///
    /// - Parameters:
    ///   - isScrollEnabled: A Boolean value that determines whether scrolling is enabled (default is true).
    ///   - isDirectionalLockEnabled: A Boolean value that determines whether scrolling is disabled in a particular direction (default is false).
    ///   - isPagingEnabled: A Boolean value that determines whether paging is enabled for the scroll view (default is false).
    ///   - scrollsToTop: A Boolean value that controls whether the scroll-to-top gesture is enabled (default is true).
    ///   - bounces: A Boolean value that controls whether the scroll view bounces past the edge of content and back again (default is true).
    ///   - alwaysBounceVertical: A Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content (default is false).
    ///   - alwaysBounceHorizontal: A Boolean value that determines whether bouncing always occurs when horizontal scrolling reaches the end of the content view (default is false).
    ///   - minimumZoomScale: A floating-point value that specifies the minimum scale factor that can be applied to the scroll view's content (default is 1.0).
    ///   - maximumZoomScale: A floating-point value that specifies the maximum scale factor that can be applied to the scroll view's content (default is 1.0).
    ///   - bouncesZoom: A Boolean value that determines whether the scroll view animates the content scaling when the scaling exceeds the maximum or minimum limits (default is true).
    ///   - keyboardDismissMode: The manner in which the keyboard is dismissed when a drag begins in the scroll view (default is .none).
    ///   - backgroundColor: Background color of the view (default is PCColor.white).
    ///   - tintColor: Text color of the view (default is nil).
    ///   - alpha: Alpha of the view (default is 1.0).
    public init(
        isScrollEnabled: Bool = true,
        isDirectionalLockEnabled: Bool = false,
        isPagingEnabled: Bool = false,
        scrollsToTop: Bool = true,
        bounces: Bool = true,
        alwaysBounceVertical: Bool = false,
        alwaysBounceHorizontal: Bool = false,
        minimumZoomScale: CGFloat = 1.0,
        maximumZoomScale: CGFloat = 1.0,
        bouncesZoom: Bool = true,
        keyboardDismissMode: UIScrollViewKeyboardDismissMode = .none,
        backgroundColor: UIColor? = PCColor.white,
        tintColor: UIColor? = nil,
        alpha: CGFloat = 1.0) {

        self.init()

        self.isScrollEnabled = isScrollEnabled
        self.isDirectionalLockEnabled = isDirectionalLockEnabled
        self.isPagingEnabled = isPagingEnabled
        self.scrollsToTop = scrollsToTop
        self.bounces = bounces
        self.alwaysBounceVertical = alwaysBounceVertical
        self.alwaysBounceHorizontal = alwaysBounceHorizontal
        self.minimumZoomScale = minimumZoomScale
        self.maximumZoomScale = maximumZoomScale
        self.bouncesZoom = bouncesZoom
        self.keyboardDismissMode = keyboardDismissMode

        self.backgroundColor = backgroundColor

        if let color = tintColor {
            self.tintColor = color
        }

        self.alpha = alpha
    }

}
