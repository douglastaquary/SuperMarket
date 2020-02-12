//
//  SupermarketLabel.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol NSAttributedStringAttributeConvertible {
    
    var attributedStringAttributes: [NSAttributedString.Key: Any]? { get }
    
}

/// Use this protocol to use text styles in UI Components
public protocol SupermarketTextStyleConformable {
    
    var textStyle: SupermarketTextStyle { get set }
    
}

public class SupermarketLabel: UILabel, SupermarketTextStyleConformable {
    
    public var textStyle: SupermarketTextStyle = .label {
        didSet {
            guard textStyle != oldValue else { return }
            applyTextStyle()
        }
    }
    
    public var prefersNegativeStyle: Bool = false {
        didSet {
            applyTextStyle()
        }
    }
    
    public init(textStyle: SupermarketTextStyle) {
        self.textStyle = textStyle
        super.init(frame: .zero)
        applyTextStyle()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        applyTextStyle()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyTextStyle()
    }
    
    func applyTextStyle() {
        font = textStyle.font
        textColor = prefersNegativeStyle ? textStyle.negativeTextColor : textStyle.textColor
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyTextStyle()
    }
    
}

public final class SupermarketLabelHeadingBold: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .headingBold
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelHeadingRegular: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .headingRegular
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelBody: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .body
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelBodyDisabled: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .bodyDisabled
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelTextButton: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .textButton
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelTextButtonDisabled: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .labelDisabled
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelCaptionDisabled: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .labelDisabled
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelInput: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .input
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelInputDisabled: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .inputDisabled
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelInputText: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .inputText
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelDisabled: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .labelDisabled
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelError: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .labelError
        super.applyTextStyle()
    }
    
}

public final class SupermarketLabelSuccess: SupermarketLabel {
    
    override final func applyTextStyle() {
        textStyle = .labelSuccess
        super.applyTextStyle()
    }
    
}


public class SupermarketTextStyle: Equatable {
    
    var font: UIFont
    var textColor: UIColor
    var negativeTextColor: UIColor
    
    public init(font: UIFont = .systemFont(ofSize: 16), textColor: UIColor = SupermarketColor.black, negativeTextColor: UIColor = SupermarketColor.white) {
        self.font = font
        self.textColor = textColor
        self.negativeTextColor = negativeTextColor
    }
    
    public static let headingBold           = SupermarketTextStyle(font: .systemFont(ofSize: 18, weight: .bold), textColor: SupermarketColor.black)
    public static let headingRegular        = SupermarketTextStyle(font: .systemFont(ofSize: 18), textColor: SupermarketColor.black)
    public static let body                  = SupermarketTextStyle(font: .systemFont(ofSize: 16), textColor: SupermarketColor.black)
    public static let bodyDisabled          = SupermarketTextStyle(font: .systemFont(ofSize: 16), textColor: SupermarketColor.pastelGray)
    public static let textButton            = SupermarketTextStyle(font: .systemFont(ofSize: 16), textColor: SupermarketColor.primaryGreen)
    public static let input                 = SupermarketTextStyle(font: .systemFont(ofSize: 16), textColor: SupermarketColor.silver)
    public static let inputDisabled         = SupermarketTextStyle(font: .systemFont(ofSize: 16), textColor: SupermarketColor.pastelGray)
    public static let inputText             = SupermarketTextStyle(font: .systemFont(ofSize: 16), textColor: SupermarketColor.black)
    public static let label                 = SupermarketTextStyle(font: .systemFont(ofSize: 14), textColor: SupermarketColor.silver)
    public static let labelDisabled         = SupermarketTextStyle(font: .systemFont(ofSize: 14), textColor: SupermarketColor.pastelGray)
    public static let labelError            = SupermarketTextStyle(font: .systemFont(ofSize: 14), textColor: SupermarketColor.carminePink)
    public static let labelSuccess          = SupermarketTextStyle(font: .systemFont(ofSize: 14), textColor: SupermarketColor.primaryGreen)
    
    public static func == (lhs: SupermarketTextStyle, rhs: SupermarketTextStyle) -> Bool {
        return lhs.font == rhs.font && lhs.textColor == rhs.textColor
    }
    
}


extension SupermarketTextStyle: NSAttributedStringAttributeConvertible {
    
    public var attributedStringAttributes: [NSAttributedString.Key : Any]? {
        var attributedStringAttributes: [NSAttributedString.Key : Any] = [:]
        attributedStringAttributes[.font] = font
        attributedStringAttributes[.foregroundColor] = textColor
        return attributedStringAttributes
    }
    
}
