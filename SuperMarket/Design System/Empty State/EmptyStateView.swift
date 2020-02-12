//
//  EmptyStateView.swift
//  SuperMarket
//
//  Created by Douglas Alexandre Barros Taquary on 11/02/20.
//  Copyright © 2020 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol EmptyStateDelegate {
    /// Returns the action of the linkButton
    ///
    /// - Parameters:
    ///   - emptyStateView: Empty State that originated the Button Action
    ///   - linkButton: Link Button Object
    func emptyStateView(_ emptyStateView: EmptyStateView, didTapButton button: SupermarketTextButton)
}

public class EmptyStateView: UIView {
    
    // MARK: - Interface builder variables
    public var imageName: String? = nil {
        didSet {
            self.imageView.isHidden = self.imageName == nil || self.imageName!.isEmpty
            self.imageView.imageName = self.imageName
        }
    }
    
    public var title: String? = nil {
        didSet {
            self.titleLabel.isHidden = self.title == nil || self.title!.isEmpty
            self.titleLabel.text = self.title
        }
    }
    
    public var text: String? = nil {
        didSet {
            self.textLabel.isHidden = self.text == nil || self.text!.isEmpty
            self.textLabel.text = self.text
        }
    }
    
    public var linkButtonTitle: String? = nil{
        didSet {
            self.linkButton.isHidden = self.linkButtonTitle == nil || self.linkButtonTitle!.isEmpty
            self.linkButton.setTitle(self.linkButtonTitle, for: .normal)
        }
    }
    
    public var iconColor: UIColor = SupermarketColor.primaryGreen {
        didSet {
            self.imageView.tintColor = self.iconColor
        }
    }
    
    // MARK: - Public Variables
    public var delegate: EmptyStateDelegate?
    
    // MARK: - Private variables
    private lazy var imageView: SupermarketImageView = {
        let imageView = SupermarketImageView()
        imageView.isHidden = self.imageName == nil || self.imageName!.isEmpty
        imageView.imageName = self.imageName
        imageView.tintColor = self.iconColor
        return imageView
    }()
    
    
    private lazy var titleLabel: SupermarketLabelHeadingBold = {
        let label = SupermarketLabelHeadingBold()
        label.isHidden = self.title == nil || self.title!.isEmpty
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = self.title
        return label
    }()
    
    private lazy var textLabel: SupermarketLabelBody = {
        let label = SupermarketLabelBody()
        label.isHidden = self.text == nil || self.text!.isEmpty
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = self.text
        return label
    }()
    
    private lazy var linkButton: SupermarketRoundedButton = {
        let button = SupermarketRoundedButton()
        button.isHidden = linkButtonTitle == nil || linkButtonTitle!.isEmpty
        button.setTitle(self.linkButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(didTapLinkButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var innerStackView: UIStackView = {
        let innerStackView = UIStackView(arrangedSubviews: [self.titleLabel, self.textLabel])
        innerStackView.axis = .vertical
        innerStackView.distribution = .fill
        innerStackView.alignment = .center
        innerStackView.spacing = 8
        return innerStackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.imageView, self.innerStackView, self.linkButton])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 48
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        self.addSubview(self.stackView)
        
        let centerXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 16)
        let topConstraint = self.stackView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 16)
        
        self.addConstraints([centerXConstraint, centerYConstraint, leadingConstraint, topConstraint, bottomConstraint])
    }
    
    @objc private func didTapLinkButton(_ sender: SupermarketTextButton) {
        delegate?.emptyStateView(self, didTapButton: sender)
    }
}

