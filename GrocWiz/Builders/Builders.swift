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
