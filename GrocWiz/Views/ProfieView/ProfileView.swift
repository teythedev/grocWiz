//
//  ProfileView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 4.09.2023.
//

import UIKit

class ProfileView: UIViewController {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var footerView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        tableView.register(ImageLeadingTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        configure()
    }
    
    
    private func configure() {
        
        view.addSubview(headerView)
        view.addSubview(footerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            footerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
}

extension ProfileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! ImageLeadingTableViewCell 
            //        var content = cell.defaultContentConfiguration()
            //        content.text = "Merhana"
            cell.imageLeading.image = UIImage(systemName: "cart.badge.plus")
            cell.titleText.text = "dsadas"
            cell.accessoryType = .disclosureIndicator
            cell.backgroundColor = .systemTeal
            return cell
       
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? ImageLeadingTableViewCell {
//            //        var content = cell.defaultContentConfiguration()
//            //        content.text = "Merhana"
//            cell.imageLeading.image = UIImage(systemName: "cart.badge.plus")
//            cell.titleText.text = "dsadas"
//            cell.accessoryType = .disclosureIndicator
//            cell.backgroundColor = .systemTeal
//            return cell
//        } else {
//            return UITableViewCell()
//        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    
    
}
