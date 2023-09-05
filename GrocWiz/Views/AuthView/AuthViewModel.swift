//
//  AuthViewModel.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 3.09.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift


final class AuthViewModel {
    weak var delegate: AuthViewModelDelegate?
    
    func actionGoogleSingIn() {
        googleSingIn()
    }
    
    private func googleSingIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Client ID")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        
        guard let delegate = delegate else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: delegate) { result, error in
            guard error == nil else {
                print("Error happen")
                return
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                print("User gelmedi")
                return
            }
            
            let credential =
            GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                let user = result?.user
                print("User \(user?.uid ?? "unknown") signed in with email \(user?.email ?? "unknown")")
                
                do {
                   
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(HomeView())
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                
                
                        
            }
        }
    }
}
