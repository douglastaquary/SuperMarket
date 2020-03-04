//
//  ShoppingListDetailViewController.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//


import UIKit

public final class ShoppingListDetailViewController: UIViewController {

    public let shopping: ShoppingList

    public init(shopping: ShoppingList) {
        self.shopping = shopping
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    private lazy var shoppingListView: ShoppingListView = {
        let v = ShoppingListView()

        v.label.text = self.shopping.title
        v.translatesAutoresizingMaskIntoConstraints = false

        return v
    }()

    public override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(shoppingListView)
        NSLayoutConstraint.activate([
            shoppingListView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shoppingListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            shoppingListView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }

}
