//
//  ListsView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 10.09.2023.
//

import UIKit

class ListsView: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Lists".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .orange
        view.addSubview(v)
        NSLayoutConstraint.activate([
            v.heightAnchor.constraint(equalToConstant: 120),
            v.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
