//
//  ListsView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 10.09.2023.
//

import UIKit

class ListsView: UIViewController {

    
    private let listsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Lists".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(addNewListAction))
        
        listsTableView.dataSource = self
        listsTableView.delegate = self
 

        view.addSubview(listsTableView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([

            listsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func addNewListAction() {
        let ac = AddNewListView()
        
        present(ac, animated: true)
    }
    
}

extension ListsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "STOCK X" + "'s list".localized()
        cell.contentConfiguration = configuration
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


