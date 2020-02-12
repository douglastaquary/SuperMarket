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
    public let total: Double
    public let lastShopping: Date
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
        title: "Quase no fim",
        total: 80.07,
        lastShopping: Date(),
        items: [
            ShoppingItem(name: "Feijão", amount: 2, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Arroz", amount: 2, price: 2.5, photo: UIImage()),
            ShoppingItem(name: "Carne", amount: 2, price: 2.5, photo: UIImage())
    ]),
    ShoppingList(
        title: "Compra do mês",
        total: 245.90,
        lastShopping: Date(),
        items: [
            ShoppingItem(name: "Manga", amount: 1, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Mamão", amount: 1, price: 2.5, photo: UIImage()),
            ShoppingItem(name: "Manteiga", amount: 1, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Alface", amount: 0.5, price: 2.5, photo: UIImage())
        ]
    ),
    ShoppingList(
        title: "Compras rápidas",
        total: 100.00,
        lastShopping: Date(),
        items: [
            ShoppingItem(name: "Biscoito Chocolate", amount: 2, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Coca 300ml", amount: 2, price: 2.5, photo: UIImage())
        ]
    ),
    ShoppingList(
        title: "Padaria",
        total: 25.00,
        lastShopping: Date(),
        items: [
            ShoppingItem(name: "Manga", amount: 1, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Mamão", amount: 1, price: 2.5, photo: UIImage()),
            ShoppingItem(name: "Manteiga", amount: 1, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Alface", amount: 0.5, price: 2.5, photo: UIImage())
        ]
    ),
    ShoppingList(
        title: "Extra",
        total: 25.00,
        lastShopping: Date(),
        items: [
            ShoppingItem(name: "Manga", amount: 1, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Mamão", amount: 1, price: 2.5, photo: UIImage()),
            ShoppingItem(name: "Manteiga", amount: 1, price: 7.5, photo: UIImage()),
            ShoppingItem(name: "Alface", amount: 0.5, price: 2.5, photo: UIImage())
        ]
    )

]
