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
        let stocksTab = StocksViewBuilder.make()
        let stocksTabItem = UITabBarItem(title: "Stocks".localized(), image: UIImage(systemName: "rectangle.stack")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "rectangle.stack.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        stocksTab.tabBarItem = stocksTabItem
        
        let listsTab = ListsViewBuilder.make()
        let listsTabItem = UITabBarItem(title: "Lists".localized(), image: UIImage(systemName: "list.clipboard")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "list.clipboard.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        listsTab.tabBarItem = listsTabItem
        
        let messagesTab = MessagesViewBuilder.make()
        let messagesTabItem = UITabBarItem(title: "Messages".localized(), image: UIImage(systemName: "envelope")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "envelope.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        messagesTab.tabBarItem = messagesTabItem
        
        let profileTab = ProfileViewBuilder.make()
        let profileTabItem = UITabBarItem(title: "Profile".localized(), image: UIImage(systemName: "person")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "person.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        profileTab.tabBarItem = profileTabItem
        setViewControllers([stocksTab,listsTab,messagesTab,profileTab], animated: false)
    }
    
    

}
