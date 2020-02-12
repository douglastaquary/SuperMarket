//
//  RoundedButtonThemePrimary.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 12/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public class RoundedButtonThemePrimary: NSObject, ButtonTheme {
    
    public func backgroundImage(for state: UIControl.State) -> UIImage? {
        return roundedRect(backgroundColor: backgroundColor(for: state), borderColor: borderColor(for: state), borderWidth: borderWidth(for: state), cornerRadius: cornerRadius(for: state))
    }
    
   public func backgroundColor(for state: UIControl.State) -> UIColor {
        if state.contains(.highlighted) {
            return SupermarketColor.primaryGreen
        } else if state.contains(.disabled) {
            return SupermarketColor.pastelGray
        }
        return SupermarketColor.primaryGreen
    }
    
    public func titleColor(for state: UIControl.State) -> UIColor {
        if state.contains(.disabled) {
            return SupermarketColor.silver
        }
        return SupermarketColor.white
    }
    
    public func borderColor(for state: UIControl.State) -> UIColor {
        return .clear
    }
    
    public func borderWidth(for state: UIControl.State) -> CGFloat {
        return 0.0
    }
    
    public func cornerRadius(for state: UIControl.State) -> CGFloat {
        return 4.0
    }
    
    public func titleFont() -> UIFont {
        return .systemFont(ofSize: 16)
    }
    
}


