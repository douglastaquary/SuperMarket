//
//  SupermarketEmptyStateViewController.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol SupermarketEmptyStateViewDelegate {
    
    func didTapButton(_ controller: SupermarketEmptyStateViewController)
    
}

public class SupermarketEmptyStateViewController: UIViewController {
    
    private lazy var emptyStateView: EmptyStateView = {
        let emptyStateView = EmptyStateView()        
        return emptyStateView
    }()
    
    public var imageName: String? = nil {
        didSet {
            emptyStateView.imageName = imageName
        }
    }
    
    public var iconColor: UIColor = SupermarketColor.primaryGreen {
        didSet {
            emptyStateView.iconColor = iconColor
        }
    }
    
    public var emptyStateTitle: String? = nil {
        didSet {
            emptyStateView.title = emptyStateTitle
        }
    }
    
    public var text: String? = nil {
        didSet {
            emptyStateView.text = text
        }
    }
    
    public var linkButtonTitle: String? = nil {
        didSet {
            emptyStateView.linkButtonTitle = linkButtonTitle
        }
    }
    
    public var shouldPopToHome: Bool = false
    
    var delegate: SupermarketEmptyStateViewDelegate?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SupermarketColor.white
        setupConstraints()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationItem.backBarButtonItem?.title = ""
//        self.navigationController?.navigationBar.topItem?.title = ""
//
//        if shouldPopToHome {
//            let image = SupermarketImage.image(named: "ic_system_arrow_left_24")
//            image?.accessibilityIdentifier = "Voltar"
//            let backButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(self.popToHomeViewController))
//            navigationItem.leftBarButtonItem = backButtonItem
//        }
////
//        delegate?.viewDidLoad(self)
    }
    
    private func setupConstraints() {
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emptyStateView)
        
        emptyStateView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        emptyStateView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        emptyStateView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
    
    public func emptyStateView(_ emptyStateView: EmptyStateView, didTapLinkButton linkButton: SupermarketTextButton) {
        delegate?.didTapButton(self)
    }
    
}

