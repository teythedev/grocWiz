//
//  ProfileHeaderView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 7.09.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var profilePicture: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .tertiarySystemBackground
        imageView.backgroundColor = .secondarySystemBackground
        imageView.roundCornerBy(20)
        imageView.layer.borderColor = UIColor.label.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    lazy var profileUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unkown User".localized()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var activeStocksInfoCard: InfoNumericCardView = {
        let infoNumericCard = InfoNumericCardView()
        infoNumericCard.infoCardIcon.image = UIImage(systemName: "rectangle.stack.fill")
        infoNumericCard.infoDescription.text = "Stocks".localized()
        return infoNumericCard
    }()
     
    lazy var activeListsInfoCard: InfoNumericCardView = {
        let infoNumericCard = InfoNumericCardView()
        infoNumericCard.infoCardIcon.image = UIImage(systemName: "list.clipboard.fill")
        infoNumericCard.infoDescription.text = "Lists".localized()
        return infoNumericCard
    }()
    
    lazy var infoCardsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [activeStocksInfoCard,activeListsInfoCard])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func didMoveToSuperview() {
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        addSubViews(views: profilePicture,profileUserName,infoCardsStackView)
        infoCardsStackView.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        profilePicture.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        profileUserName.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        
        NSLayoutConstraint.activate([
            profilePicture.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            profilePicture.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            profilePicture.topAnchor.constraint(equalTo: topAnchor),
            profilePicture.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            profileUserName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 16),
            profileUserName.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor),
            profileUserName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoCardsStackView.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 8),
            infoCardsStackView.leadingAnchor.constraint(equalTo: profilePicture.leadingAnchor),
            infoCardsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoCardsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }

}
