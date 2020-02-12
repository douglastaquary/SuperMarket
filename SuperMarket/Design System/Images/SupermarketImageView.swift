//
//  SupermarketImageView.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public final class SupermarketImage: NSObject {
    
    public static func image(named name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle(for: SupermarketImage.self), compatibleWith: nil)
    }
    
}

public final class SupermarketImageView: UIImageView {
        
    @IBInspectable public var imageName: String? = nil {
        didSet {
            guard let name = imageName else {
                self.image = nil
                return
            }
            self.image = UIImage(named: name, in: Bundle(for: SupermarketImage.self), compatibleWith: nil)
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return self.image?.size ?? .zero
    }
    
}

