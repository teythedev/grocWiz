//
//  HomeView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 3.09.2023.
//

import UIKit
import FirebaseAuth

class HomeView: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.backgroundColor = .tertiarySystemBackground
        tabBar.tintColor = .label
        configure()
    }
    

    
    private func configure() {
        let cellarsTab = FridgesViewBuilder.make()
        let cellarsTabItem = UITabBarItem(title: "Fridges".localized(), image: UIImage(systemName: "refrigerator")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "refrigerator.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        cellarsTab.tabBarItem = cellarsTabItem
        
        let listsTab = ListsViewBuilder.make()
        let listsTabItem = UITabBarItem(title: "Lists".localized(), image: UIImage(systemName: "list.clipboard")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "list.clipboard.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        listsTab.tabBarItem = listsTabItem
        
        let messagesTab = MessagesViewBuilder.make()
        let messagesTabItem = UITabBarItem(title: "Messages".localized(), image: UIImage(systemName: "envelope")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "envelope.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        messagesTab.tabBarItem = messagesTabItem
        
        let profileTab = ProfileViewBuilder.make()
        let profileTabItem = UITabBarItem(title: "Profile".localized(), image: UIImage(systemName: "person")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "person.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        profileTab.tabBarItem = profileTabItem
        setViewControllers([cellarsTab,listsTab,messagesTab,profileTab], animated: false)
    }
    
    

}
