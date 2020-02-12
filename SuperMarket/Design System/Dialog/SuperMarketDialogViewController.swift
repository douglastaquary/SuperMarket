//
//  SuperMarketDialogViewController.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

@objc public final class uperMarketDialogViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = SupermarketLabelHeadingBold()
        label.numberOfLines = 0
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.accessibilityTraits = [.staticText, .header]
        return label
    }()
    private lazy var messageLabel: UILabel = {
        let label = SupermarketLabelBody()
        label.numberOfLines = 0
        label.text = message
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.messageLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.textStackView, self.buttonsStackView])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .trailing
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dialogTransitioningDelegate = SuperMarketDialogTransitioningDelegate()
    
    
    public var message: String?
    public private(set) var actions: [SupermaketDialogAction] = []
    
    @objc public init(title: String?, message: String?) {
        super.init(nibName: nil, bundle: nil)
        self.message = message
        self.title = title
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        setupPresentation()
        setupApparence()
        setupConstraints()
        calculatePreferredContentSize()
    }
    
    @objc public func addAction(_ action: SupermaketDialogAction) {
        guard actions.count < 2 else { return }
        let actionButton = SupermarketTextButton(type: .system)
        actionButton.setTitle(action.title, for: .normal)
        actionButton.tag = actions.count
        actionButton.addTarget(self, action: #selector(didTapActionButton(_:)), for: .touchUpInside)
        actions.append(action)
        buttonsStackView.addArrangedSubview(actionButton)
        calculatePreferredContentSize()
    }
    
    @objc func didTapActionButton(_ sender: UIButton) {
        let action = actions[sender.tag]
        dismiss(animated: true) {
            action.handler?(action)
        }
    }
    
    private func setupConstraints() {
        view.addSubview(rootStackView)
        let topConstraint = rootStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24)
        let leadingConstraint = rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        let bottomConstraint = rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        let trailingConstraint = rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        let textStackViewConstraint = textStackView.widthAnchor.constraint(equalTo: rootStackView.widthAnchor)
        view.addConstraints([topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, textStackViewConstraint])
    }
    
    private func setupApparence() {
        view.backgroundColor = SupermarketColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 4.0
    }
    
    private func setupPresentation() {
        modalPresentationStyle = .custom
        transitioningDelegate = dialogTransitioningDelegate
    }
    
    private func calculatePreferredContentSize() {
        let initialSize = CGSize(width: UIScreen.main.bounds.width - 32, height: .leastNonzeroMagnitude)
        let expectedSize = view.systemLayoutSizeFitting(initialSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        preferredContentSize = expectedSize
    }
    
}


