//
//  InfoCardView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 8.09.2023.
//

import UIKit

class InfoNumericCardView: UIView {
    
    lazy var infoCardIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        return imageView
    }()
    
    lazy var infoNumeric: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .label
        return label
    }()
    
    lazy var infoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unknown".localized()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()
    

    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupViews() {
        roundCornerBy(10)
        backgroundColor = .secondarySystemBackground
        addSubview(infoCardIcon)
        addSubview(infoNumeric)
        addSubview(infoDescription)
        
        NSLayoutConstraint.activate([
            infoCardIcon.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            infoCardIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            infoNumeric.topAnchor.constraint(equalTo: infoCardIcon.bottomAnchor, constant: 8),
            infoNumeric.leadingAnchor.constraint(equalTo: infoCardIcon.leadingAnchor),
            infoDescription.topAnchor.constraint(equalTo: infoNumeric.bottomAnchor, constant: 8),
            infoDescription.leadingAnchor.constraint(equalTo: infoCardIcon.leadingAnchor),
            infoDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}
