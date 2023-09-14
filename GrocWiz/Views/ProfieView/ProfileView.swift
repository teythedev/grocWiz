//
//  ProfileView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 4.09.2023.
//

import UIKit

class ProfileView: UIViewController {
    
    private enum ListTilesEnum: String, CaseIterable {
        case getPro = "Get GrocWiz Pro"
        case language = "Language"
        case rateUs = "Rate us on the App Store"
        case feedback = "Feedback"
        case privacyPolicy = "Privacy Policy"
        case termsOfUse = "Terms of Use"
        
        var icon: String {
            switch self {
            case .getPro:
                return "crown"
            case .language:
                return "globe.asia.australia"
            case .rateUs:
                return "star"
            case .feedback:
                return "pencil.line"
            case .privacyPolicy:
                return "lock"
            case .termsOfUse:
                return "book"
            }
        }
    }
    
    lazy var headerView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    lazy var listView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ImageLeadingTableViewCell.self, forCellReuseIdentifier: "ImageLeadingCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.backgroundColor = UIColor.makeTransParent()
        table.selectionFollowsFocus = false
        return table
    }()
    
    lazy var signOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Logout".localized()
        button.tintColor = .label
        button.target = self
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = signOutButton
        title = "Profile".localized()
        configure()
    }

    private func configure() {
        view.addSubview(headerView)
        view.addSubview(listView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
        ])
    }
}

extension ProfileView: UITableViewDelegate {
    
}

extension ProfileView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ListTilesEnum.allCases.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < ListTilesEnum.allCases.count  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var configuration = cell.defaultContentConfiguration()
            configuration.image = UIImage(systemName: ListTilesEnum.allCases[indexPath.row].icon)
            configuration.imageProperties.tintColor = .label
            configuration.text = ListTilesEnum.allCases[indexPath.row].rawValue.localized()
            cell.selectionStyle = .none
            cell.backgroundColor = .makeTransParent()
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
 
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var configuration = cell.defaultContentConfiguration()
            configuration.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            configuration.textProperties.alignment = .center
            cell.backgroundColor = .makeTransParent()
            cell.contentConfiguration = configuration
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}


//    @objc func signOutGoogle() {
//        do {
//            try Auth.auth().signOut()
//            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(AuthViewBuilder.make())
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
//    }
