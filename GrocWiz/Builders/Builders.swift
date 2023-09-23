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
    static func make() -> HomeView {
        let homeView = HomeView()
        return homeView
    }
}

struct StocksViewBuilder {
    static func make() -> UINavigationController {
        let stocksView = StocksView()
        stocksView.stocksViewModel = StocksViewModel()
        let navigationController = UINavigationController(rootViewController: stocksView)
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







