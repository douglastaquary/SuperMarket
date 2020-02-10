//
//  ShoppingList.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import Foundation
import UIKit

public struct ShoppingList {    
    public let title: String
    public let items: [ShoppingItem]
}

public struct ShoppingItem {
    public let name: String
    public let amount: Double
    public let price: Double
    public let photo: UIImage
}


public let shopping = [
    ShoppingList(
        title: "Quase vazio",
        items: [
            ShoppingItem(name: "Feijão", amount: 2, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Arroz", amount: 2, price: 2.5, photo: UIImage())
        ]
    ),
    ShoppingList(
        title: "Compras rápidas",
        items: [
            ShoppingItem(name: "Feijão", amount: 2, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Arroz", amount: 2, price: 2.5, photo: UIImage())
        ]
    )

]
