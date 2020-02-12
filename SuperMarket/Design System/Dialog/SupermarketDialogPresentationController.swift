//
//  SupermarketDialogPresentationController.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

@objc public final class SupermarketDialogPresentationController: UIPresentationController {
    
    override public var frameOfPresentedViewInContainerView: CGRect {
        let containerViewCenter = containerView?.center ?? .zero
        let size = presentedViewController.preferredContentSize
        let origin = CGPoint(x: containerViewCenter.x - size.width / 2, y: containerViewCenter.y - size.height / 2)
        return CGRect(origin: origin, size: size)
    }
    
    override public func containerViewDidLayoutSubviews() {
        guard presentedView?.frame != frameOfPresentedViewInContainerView else { return }
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override public func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
}

