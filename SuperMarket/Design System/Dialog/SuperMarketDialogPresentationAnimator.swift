//
//  SuperMarketDialogPresentationAnimator.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public final class SuperMarketDialogPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        containerView.alpha = 0
        
        let toView = transitionContext.view(forKey: .to)!
        toView.alpha = 0.0
        
        let toFinalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
        let initialScaleX = containerView.frame.width * 0.6 / toFinalFrame.width
        let middleScaleX = containerView.frame.width / toFinalFrame.width
        
        toView.transform = toView.transform.scaledBy(x: initialScaleX, y: initialScaleX)
        containerView.addSubview(toView)
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                toView.alpha = 1.0
                containerView.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.496, animations: {
                toView.transform = CGAffineTransform(scaleX: middleScaleX, y: middleScaleX)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.496, relativeDuration: 0.5, animations: {
                toView.transform = .identity
            })
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.337
    }
    
}

