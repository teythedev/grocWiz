//
//  LoadingView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 3.09.2023.
//

import UIKit

class LoadingView: UIView {

    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .label
        indicator.startAnimating()
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func configure(){
        isHidden = true
        layer.cornerRadius = 10
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        addSubview(indicator)
        NSLayoutConstraint.activate([

            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 50, height: 50)
    }
    
    

}
