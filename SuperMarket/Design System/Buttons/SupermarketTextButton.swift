//
//  SupermarketTextButton.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

@IBDesignable
public class SupermarketTextButton: UIButton {
    
    var normalTitleAttributes: [NSAttributedString.Key: Any]? {
        return underlinedAttributes(for: .textButton)
    }
    
    var disabledTitleAttributes: [NSAttributedString.Key: Any]? {
        return underlinedAttributes(for: .label)
    }
    
    @IBInspectable public var underlineEnable: Bool = true {
        didSet {
            applyStyle()
        }
    }
    
    @IBInspectable public var prefersNegativeStyle: Bool = false {
        didSet {
            applyStyle()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }
    
    func applyStyle() {
        if let normalTitle: String = title(for: .normal) {
            let normalAttributedTitle = NSAttributedString(string: normalTitle, attributes: normalTitleAttributes)
            setAttributedTitle(normalAttributedTitle, for: .normal)
        }
        if let disabledTitle: String = title(for: .disabled) {
            let disabledAttributedTitle = NSAttributedString(string: disabledTitle, attributes: disabledTitleAttributes)
            setAttributedTitle(disabledAttributedTitle, for: .disabled)
        }
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        applyStyle()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyStyle()
    }
    
    private func underlinedAttributes(for textStyle: SupermarketTextStyle) -> [NSAttributedString.Key: Any]? {
        var textAttributtes = textStyle.attributedStringAttributes
        if prefersNegativeStyle {
            textAttributtes?[.foregroundColor] = textStyle.negativeTextColor
            textAttributtes?[.underlineColor] = getUnderlineColor(textStyle.negativeTextColor)
        } else {
            textAttributtes?[.underlineColor] = getUnderlineColor(textStyle.textColor)
        }
        textAttributtes?[.underlineStyle] = NSUnderlineStyle.single.rawValue
        return textAttributtes
    }
    
    
    private func getUnderlineColor(_ defaultColor: UIColor) -> UIColor {
        return underlineEnable ? defaultColor : .clear
        
    }
}

