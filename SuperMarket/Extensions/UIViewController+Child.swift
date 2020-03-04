//
//  UIViewController+Child.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public extension UIViewController {
    func install(_ child: UIViewController) {
        addChild(child)

        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)

        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        child.didMove(toParent: self)
    }
}
