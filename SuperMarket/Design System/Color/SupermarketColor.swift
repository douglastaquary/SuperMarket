//
//  SupermarketColor.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

/// The color scheme to be widely used through the app.
public final class SupermarketColor: NSObject {
    
    private override init() { super.init() }
    
    // MARK: - Neutral tones
    
    static public let black = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    static public let arsenic = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
    static public let silver = #colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1)
    static public let lightGray = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    static public let pastelGray = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    static public let carminePink = #colorLiteral(red: 0.9450980392, green: 0.2980392157, blue: 0.2980392157, alpha: 1)
    static public let white = UIColor.white
    
    // MARK: - Primary tones
    
    /// This color is designated to primary action elements.
    static public let primaryGreen = #colorLiteral(red: 0.4509803922, green: 0.6196078431, blue: 0.2549019608, alpha: 1)
    
    // MARK: - Support tones
    
    static public let yellow = #colorLiteral(red: 0.9490196078, green: 0.6470588235, blue: 0.1019607843, alpha: 1)
    static public let ocean = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    static public let orange = #colorLiteral(red: 0.9725490196, green: 0.5098039216, blue: 0, alpha: 1)

    

    
}

