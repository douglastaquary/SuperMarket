//
//  SuperMarketFlowController.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

fileprivate func makeViewFlowLayout() -> UICollectionViewFlowLayout {
    let l = UICollectionViewFlowLayout()
    let margin = CGFloat(16)

    l.scrollDirection = .vertical
    l.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
    l.minimumLineSpacing = 4
    l.sectionInset = UIEdgeInsets(top: margin, left: 0, bottom: 0, right: 0)

    return l
}

public final class SuperMarketFlowController: UIViewController {

    private typealias SupermarketCollectionController = GenericCollectionViewController<ShoppingListView, ContainerCollectionViewCell<ShoppingListView>>

    private lazy var ownedNavigationController: UINavigationController = {
        UINavigationController(rootViewController: self.stateController)
    }()

    private lazy var stateController: StateViewController = {
        let c = StateViewController()
        c.title = "Lista de Compras"
        return c
    }()

    private lazy var supermarketListCollectionController: SupermarketCollectionController = {
        let c = SupermarketCollectionController(viewType: ShoppingListView.self, flowLayout: makeViewFlowLayout())

        c.numberOfItems = { shopping.count }
        c.configureView = { $1.label.text = shopping[$0.item].title }
        c.didSelectView = { [weak self] indexPath, _ in
            self?.showDetail(for: shopping[indexPath.item])
        }

        return c
    }()

    private func loadRegions() {
        stateController.state = .loading(message: "Loading shopping...")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stateController.state = .content(controller: self.supermarketListCollectionController)
        }
    }

    public override func loadView() {
        view = UIView()
        install(ownedNavigationController)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        loadRegions()
    }

    private func showDetail(for shoppingList: ShoppingList) {
        let controller = ShoppingListDetailViewController(shopping: shoppingList)
        controller.title = "Shopping Detail"
        ownedNavigationController.pushViewController(controller, animated: true)
    }

}
