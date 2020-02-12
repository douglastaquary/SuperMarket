//
//  SuperMarketDialogTransitioningDelegate.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public final class SuperMarketDialogTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SupermarketDialogPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SuperMarketDialogPresentationAnimator()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SantanderDialogDismissionAnimator()
    }
    
}
