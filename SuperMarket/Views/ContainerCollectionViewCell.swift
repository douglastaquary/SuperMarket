//
//  ContainerCollectionViewCell.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public final class ContainerCollectionViewCell<V: UIView>: UICollectionViewCell {

    public lazy var view: V = {
        return V()
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setup() {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)

        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
