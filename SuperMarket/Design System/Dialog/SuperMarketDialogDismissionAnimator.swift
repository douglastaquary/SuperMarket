//
//  SuperMarketDialogDismissionAnimator.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public final class SantanderDialogDismissionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        
        fromView.alpha = 1.0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
            containerView.alpha = 0
            fromView.alpha = 0
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
}

