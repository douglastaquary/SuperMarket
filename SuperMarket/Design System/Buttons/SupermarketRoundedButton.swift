//
//  SupermarketRoundedButton.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 12/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol ThemedButton {
    
    var theme: ButtonTheme { get }
    
}


public class SupermarketRoundedButton: UIButton, ThemedButton, CAAnimationDelegate {
    
    /// Defines the if the button theme is primary.
    /// If yes it will set the default primary theme, otherwise it will set the secondary theme
    @IBInspectable var isPrimary: Bool = true {
        didSet {
            if isPrimary {
                theme = RoundedButtonThemePrimary()
            } else {
                theme = RoundedButtonThemeSecondary()
            }
        }
    }
    
    /// The button theme, the theme can customize text, background and border color of the button for various states
    @objc public var theme: ButtonTheme {
        didSet {
            apply(theme: theme)
        }
    }
    
    @objc public override init(frame: CGRect) {
        self.theme = RoundedButtonThemePrimary()
        super.init(frame: frame)
        setup()
    }
    
    @objc public required init?(coder aDecoder: NSCoder) {
        self.theme = RoundedButtonThemePrimary()
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layer.masksToBounds = true
        setupConstraints()
        apply(theme: theme)
    }
    
    func setupConstraints() {
        let minimumWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 112)
        let fixedHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 48)
        fixedHeight.priority = .defaultHigh
        addConstraints([minimumWidth, fixedHeight])
    }
    
    @objc public func apply(theme: ButtonTheme) {
        titleLabel?.font = theme.titleFont()
        
        setTitleColor(theme.titleColor(for: .normal), for: .normal)
        setTitleColor(theme.titleColor(for: .highlighted), for: .highlighted)
        setTitleColor(theme.titleColor(for: .disabled), for: .disabled)
        
        setBackgroundImage(theme.backgroundImage(for: .normal), for: .normal)
        setBackgroundImage(theme.backgroundImage(for: .highlighted), for: .highlighted)
        setBackgroundImage(theme.backgroundImage(for: .disabled), for: .disabled)
        
        layer.cornerRadius = theme.cornerRadius(for: state)
    }
    
    // MARK: - Scale Animation
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !state.contains(.disabled), !UIAccessibility.isReduceMotionEnabled {
            performScaleAnimation()
        }
        super.touchesBegan(touches, with: event)
    }
    
    func performScaleAnimation() {
        layer.removeAllAnimations()
        
        let scaleDownAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleDownAnimation.fromValue = 1.0
        scaleDownAnimation.toValue = 0.95
        scaleDownAnimation.duration = 0.17
        scaleDownAnimation.isRemovedOnCompletion = true
        scaleDownAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let scaleUpAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleUpAnimation.fromValue = 0.95
        scaleUpAnimation.toValue = 1.0
        scaleUpAnimation.beginTime = scaleDownAnimation.duration
        scaleUpAnimation.duration = 0.33
        scaleUpAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleDownAnimation, scaleUpAnimation]
        animationGroup.duration = scaleDownAnimation.duration + scaleUpAnimation.duration
        
        layer.add(animationGroup, forKey: "scaleAnimation")
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        apply(theme: theme)
    }
    
}


import UIKit

@objc public protocol ButtonTheme {
    
    func backgroundImage(for state: UIControl.State) -> UIImage?
    
    func backgroundColor(for state: UIControl.State) -> UIColor
    
    func titleColor(for state: UIControl.State) -> UIColor
    
    func borderColor(for state: UIControl.State) -> UIColor
    
    func borderWidth(for state: UIControl.State) -> CGFloat
    
    func cornerRadius(for state: UIControl.State) -> CGFloat
    
    func titleFont() -> UIFont
    
}

extension ButtonTheme {
    
    public func roundedRect(backgroundColor: UIColor, borderColor: UIColor = .clear, borderWidth: CGFloat = 0.0, cornerRadius: CGFloat) -> UIImage? {
        let image: UIImage?
        let minimumWidth = max(cornerRadius * 2, borderWidth * 2) + 1
        let minimumSize = CGSize(width: minimumWidth, height: minimumWidth)
        let fillRect = CGRect(origin: .zero, size: minimumSize)
        let fillPath = UIBezierPath(roundedRect: fillRect, cornerRadius: cornerRadius)
        fillPath.lineWidth = borderWidth * 2
        
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContextWithOptions(fillRect.size, false, 0.0)
        
        fillPath.addClip()
        
        backgroundColor.setFill()
        borderColor.setStroke()
        
        UIRectFill(fillRect)
        fillPath.stroke()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        let minCapInsets = max(cornerRadius, borderWidth)
        return image?.resizableImage(withCapInsets: UIEdgeInsets(top: minCapInsets, left: minCapInsets, bottom: minCapInsets, right: minCapInsets))
    }
    
}
