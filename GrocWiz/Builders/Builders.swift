//
//  Builders.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 3.09.2023.
//

import UIKit

struct AuthViewBuilder {
    static func make() -> UIViewController {
        let viewModel = AuthViewModel()
        let vc = AuthView()
        vc.authViewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

struct HomeViewBuilder {
    static func make() -> UITabBarController {
        let homeView = UITabBarController()
        let fridges = FridgesViewBuilder.make()
        let cellarsTabItem = UITabBarItem(title: "Fridges".localized(), image: UIImage(systemName: "refrigerator")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "refrigerator.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        fridges.tabBarItem = cellarsTabItem
        let lists = ListsViewBuilder.make()
        let listsTabItem = UITabBarItem(title: "Lists".localized(), image: UIImage(systemName: "list.clipboard")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "list.clipboard.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        lists.tabBarItem = listsTabItem
        let messages = MessagesViewBuilder.make()
        let messagesTabItem = UITabBarItem(title: "Messages".localized(), image: UIImage(systemName: "envelope")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "envelope.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        messages.tabBarItem = messagesTabItem
        let profile = ProfileViewBuilder.make()
        let profileTabItem = UITabBarItem(title: "Profile".localized(), image: UIImage(systemName: "person")?.withTintColor(.label, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "person.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal))
        profile.tabBarItem = profileTabItem
        homeView.tabBarController?.setViewControllers([fridges,lists,messages,profile], animated: false)
        return homeView
    }
}

struct FridgesViewBuilder {
    static func make() -> UINavigationController {
        let fridgesView = FridgesView()
        let navigationController = UINavigationController(rootViewController: fridgesView)
        return navigationController
    }
}

struct ListsViewBuilder {
    static func make() -> UINavigationController {
        let listsView = ListsView()
        let navigationController = UINavigationController(rootViewController: listsView)
        return navigationController
    }
}

struct MessagesViewBuilder {
    static func make() -> UINavigationController {
        let messagesView = MessagesView()
        let navigationController = UINavigationController(rootViewController: messagesView)
        return navigationController
    }
}

struct ProfileViewBuilder {
    static func make() -> UINavigationController {
        let profileView = ProfileView()
        let navigationController = UINavigationController(rootViewController: profileView)
        return navigationController
    }
}







