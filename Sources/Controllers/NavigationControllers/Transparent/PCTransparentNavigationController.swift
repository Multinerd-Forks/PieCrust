//
//  PCTransparentNavigationController.swift
//  PieCrust
//
//  Created by Omar Albeik on 12.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation
import SwifterSwift

/// Transparent `PCNavigationController`.
open class PCTransparentNavigationController: PCNavigationController {

    fileprivate var player: AVPlayer?
    fileprivate var playerLayer: AVPlayerLayer?

    public var backgroundImage: UIImage? {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }

    /// Optional background video URL.
    public var backgroundVideoUrl: URL? {
        didSet {
            guard let url = backgroundVideoUrl else { return }

            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try? AVAudioSession.sharedInstance().setActive(true)

            player = AVPlayer(url: url)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.videoGravity = .resizeAspectFill

            player?.volume = 0
            player?.isMuted = true
            player?.allowsExternalPlayback = false
            player?.actionAtItemEnd = .none
            playerLayer?.frame = view.layer.bounds
            view.backgroundColor = PCColor.clear

            view.layer.insertSublayer(playerLayer!, at: 0)

            NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(_:)), name: .AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        }
    }

    /// Optional dim color above video.
    public var vidoeDimColor: UIColor? {
        didSet {
            guard let videoLayer = playerLayer else { return }
            guard let color = vidoeDimColor else { return }

            let dimColorLayer = CALayer()
            dimColorLayer.frame = view.layer.frame
            dimColorLayer.backgroundColor = color.cgColor
            view.layer.insertSublayer(dimColorLayer, above: videoLayer)
        }
    }

    private lazy var backgroundImageView: PCImageView = {
        return PCImageView(image: nil, contentMode: .scaleAspectFill)
    }()

    /// Called after the controller's view is loaded into memory.
    override open func viewDidLoad() {
        super.viewDidLoad()

        view.insertSubview(backgroundImageView, at: 0)
        backgroundImageView.snp.makeConstraints { $0.edges.equalToSuperview() }

        delegate = self
    }

    /// Notifies the view controller that its view was added to a view hierarchy.
    ///
    /// - Parameter animated: If true, the view was added to the window using an animation.
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        player?.play()
    }

    /// Notifies the view controller that its view was removed from a view hierarchy.
    ///
    /// - Parameter animated: If true, the disappearance of the view was animated.
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        player?.pause()
    }

    @objc private func playerItemDidReachEnd(_ sender: Notification) {
        guard let player = sender.object as? AVPlayerItem else { return }
        player.seek(to: kCMTimeZero)
    }

}

// MARK: - UINavigationControllerDelegate
extension PCTransparentNavigationController: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideTransition(transitionOperation: operation)
    }

}
