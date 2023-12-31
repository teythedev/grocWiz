//
//  ItemCollectionViewCell.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 12.09.2023.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ItemCollectionViewCell"
    
    var increaseButtonTapCallback: () -> () = {}
    var decreaseButtonTapCallback: () -> () = {}
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    let increaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func increaseButtonTapped() {
        increaseButtonTapCallback()
    }
    
    let decreaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func decreaseButtonTapped() {
        decreaseButtonTapCallback()
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubViews(views: nameLabel,stackView)
        contentView.roundCornerBy(20)
        contentView.backgroundColor = .tertiarySystemBackground
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(amountLabel)
        stackView.addArrangedSubview(increaseButton)
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -4),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:  -16),
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func prepareForReuse() {
        amountLabel.text = ""
        nameLabel.text = ""
        increaseButtonTapCallback = {}
        decreaseButtonTapCallback = {}
    }
}
