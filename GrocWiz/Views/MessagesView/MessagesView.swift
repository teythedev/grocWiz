//
//  MessagesView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 10.09.2023.
//

import UIKit

class MessagesView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Messages".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

  

}
