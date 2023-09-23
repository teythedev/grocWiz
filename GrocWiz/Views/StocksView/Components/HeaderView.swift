//
//  HeaderView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 13.09.2023.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    
    let headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerTitle)
        headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        headerTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
   
}
