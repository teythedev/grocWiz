//
//  HomeView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 3.09.2023.
//

import UIKit
import FirebaseAuth

class HomeView: UIViewController {
    
    lazy var googleSingOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign out", for: .normal)
        button.addTarget(self, action: #selector(signOutGoogle), for: .touchUpInside)
        return button
    }()
    
    lazy var loadingIndicator: LoadingView = {
        let loadingView = LoadingView()
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        view.addSubview(googleSingOutButton)
        view.addSubview(loadingIndicator)
    
        NSLayoutConstraint.activate([
            googleSingOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleSingOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            
        ])
        

    }
    

    
    @objc func signOutGoogle() {
        do {
            try Auth.auth().signOut()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(AuthViewBuilder.make())
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }


}
