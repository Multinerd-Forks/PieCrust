//
//  SlideTransition.swift
//  PieCrust
//
//  Created by Omar Albeik on 12.03.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

internal typealias TransitionFrame = (start: CGRect, end: CGRect)

internal class SlideTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let transitionFrames: SlideTransitionFrames

    init(transitionOperation: UINavigationControllerOperation) {
        transitionFrames = SlideTransitionFrames(transitionOperation: transitionOperation, slideViewSize: UIScreen.main.bounds.size)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView

        containerView.addSubview(fromViewController.view)
        containerView.addSubview(toViewController.view)

        let toView = toViewController.view!
        toView.frame = transitionFrames.toView.end
        toView.setNeedsLayout()
        toView.layoutIfNeeded()

        toViewController.view.frame = transitionFrames.toView.start

        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
            toViewController.view.frame = self.transitionFrames.toView.end
            fromViewController.view.frame = self.transitionFrames.fromView.end

        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }

}

internal struct SlideTransitionFrames {

    var fromView: TransitionFrame
    var toView: TransitionFrame

    init(transitionOperation: UINavigationControllerOperation, slideViewSize: CGSize) {
        let direction: CGFloat = (transitionOperation == .push) ? 1.0 : (transitionOperation == .pop) ? -1.0 : 0.0
        let frame = CGRect(origin: .zero, size: slideViewSize)

        fromView = (
            start: frame,
            end: frame.offsetBy(dx: -direction * slideViewSize.width, dy: 0)
        )

        toView = (
            start: frame.offsetBy(dx: direction * slideViewSize.width, dy: 0),
            end: frame
        )
    }

}
