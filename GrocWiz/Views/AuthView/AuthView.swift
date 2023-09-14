//
//  ViewController.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 2.09.2023.
//

import UIKit


class AuthView: UIViewController {
    
    var authViewModel: AuthViewModel?
    

    lazy var googleSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue with Google".localized(), for: .normal)
        button.setImage(UIImage(named: "Google"), for: .normal)
        var config = UIButton.Configuration.bordered()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.imagePadding = 8
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        button.configuration = config
        button.addTarget(self, action: #selector(actionGoogleSignInButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemOrange
        view.addSubview(googleSignInButton)
        NSLayoutConstraint.activate([
            //googleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleSignInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            googleSignInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            googleSignInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func actionGoogleSignInButton() {
        if let authViewModel = authViewModel {
            authViewModel.actionGoogleSingIn()
        }else {
            print("auth view model is null")
        }
        
    }
}

extension AuthView: AuthViewModelDelegate {
    func successLogin() {
        print("Login successfully")
    }
}



