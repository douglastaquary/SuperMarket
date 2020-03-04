//
//  GenericCollectionViewController.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit


public final class GenericCollectionViewController<V: UIView, C: ContainerCollectionViewCell<V>>: UICollectionViewController  {
    
    public init(viewType: V.Type, flowLayout: UICollectionViewFlowLayout) {
        super.init(collectionViewLayout: flowLayout)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public var numberOfItems: () -> Int = { 0 } {
        didSet {
            collectionView?.reloadData()
        }
    }

    public var configureView: (IndexPath, V) -> () = { _, _ in } {
        didSet {
            collectionView?.reloadData()
        }
    }

    public var didSelectView: (IndexPath, V) -> () = { _, _ in }

    public override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .systemBackground
        collectionView?.register(C.self, forCellWithReuseIdentifier: "cell")
    }

    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItems()
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? C else {
            fatalError("Unexpected cell type dequeued from collection view")
        }

        configureView(indexPath, cell.view)

        return cell
    }

    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? C else { return }

        didSelectView(indexPath, cell.view)
    }
    

}
