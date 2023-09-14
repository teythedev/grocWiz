//
//  ImageLeadingTableViewCell.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 4.09.2023.
//

import UIKit

class ImageLeadingTableViewCell: UITableViewCell {
    
    lazy var imageLeading: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.scalesLargeContentImage = true
        return imageView
    }()
    
    lazy var titleText: UILabel = {
        let label = UILabel()
    
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        accessoryView?.tintColor = .black
        contentView.addSubview(imageLeading)
        contentView.addSubview(titleText)
        imageLeading.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        imageLeading.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        NSLayoutConstraint.activate([
            imageLeading.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            imageLeading.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            imageLeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageLeading.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleText.leadingAnchor.constraint(equalTo: imageLeading.trailingAnchor, constant: 16),
            titleText.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
