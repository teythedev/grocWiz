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
        imageView .translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLeading)
        contentView.addSubview(titleText)
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 60),
            imageLeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageLeading.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageLeading.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            imageLeading.widthAnchor.constraint(equalToConstant: imageLeading.image?.size.width ?? 40),
            titleText.leadingAnchor.constraint(equalTo: imageLeading.trailingAnchor, constant: 8),
            titleText.topAnchor.constraint(equalTo: imageLeading.topAnchor),
            titleText.bottomAnchor.constraint(equalTo: imageLeading.bottomAnchor),
            titleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
