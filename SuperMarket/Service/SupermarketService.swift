//
//  SupermarketService.swift
//  SuperMarket
//
//  Created by resource on 03/03/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import Foundation
import UIKit

protocol SupermarketServiceProtocol {
    func loadContent(with completion: @escaping (Result<[ShoppingList], Error>) -> Void)
}


public class SupermarketService: NSObject, SupermarketServiceProtocol {
    
    public override init() {
        
    }
    
    func loadContent(with completion: @escaping (Result<[ShoppingList], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(shopping))
        }
    }
}
