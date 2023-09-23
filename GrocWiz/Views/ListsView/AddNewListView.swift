//
//  StockPickerController.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 18.09.2023.
//

import UIKit

class AddNewListView: UIViewController {
    
    private var stocksSearchResult: [Stock] = []
    
    
    private let closeHolderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.roundCornerBy(4)
        return view
    }()
    
    private let currentStocksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let searchBar: UISearchController = {
        let searchbar = UISearchController(searchResultsController: nil)
        searchbar.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchbar.searchBar.placeholder = "Please enter a stock name".localized()
        return searchbar
    }()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        searchBar.searchResultsUpdater = self
        currentStocksTableView.delegate = self
        currentStocksTableView.dataSource = self
        
        view.addSubViews(views: closeHolderView,
                         searchBar.searchBar,
                         currentStocksTableView
        )
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            closeHolderView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            closeHolderView.heightAnchor.constraint(equalToConstant: 8),
            closeHolderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 4),
            closeHolderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.searchBar.topAnchor.constraint(equalTo: closeHolderView.bottomAnchor, constant: 4),
            searchBar.searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            currentStocksTableView.topAnchor.constraint(equalTo: searchBar.searchBar.bottomAnchor,constant: 8),
            currentStocksTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            currentStocksTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            currentStocksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension AddNewListView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else {return}
        stocksSearchResult = TestData.stocks.filter(
            { (stock:Stock) -> Bool in
                let titleMatch = stock.title.range(of: query, options: NSString.CompareOptions.caseInsensitive)
                return titleMatch != nil
            }
        )
        currentStocksTableView.reloadData()
    }
}

extension AddNewListView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return searchBar.isActive ? stocksSearchResult.count + 1 : TestData.stocks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        if searchBar.isActive {
            if(indexPath.row > stocksSearchResult.count - 1) {
                contentConfig.text = "- Add new stock -"
                contentConfig.textProperties.alignment = .center
                contentConfig.textProperties.color = .red
            }else {
                contentConfig.text = stocksSearchResult[indexPath.row].title
            }
            
        } else {
            if(indexPath.row > TestData.stocks.count - 1) {
                contentConfig.text = "- Add new stock -"
                contentConfig.textProperties.alignment = .center
                contentConfig.textProperties.color = .red
            }else {
                contentConfig.text = TestData.stocks[indexPath.row].title
            }
        }
        cell.contentConfiguration = contentConfig
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBar.isActive {
            if(indexPath.row > stocksSearchResult.count - 1) {
                print("neww stock added")
            }else {
                print(stocksSearchResult[indexPath.row])
            }
        } else {
            if(indexPath.row > stocksSearchResult.count - 1) {
                
                let ac = UIAlertController(title: "Add new stock".localized(), message: nil, preferredStyle: .alert)
                
                ac.addTextField { textField in
                    textField.placeholder = "Please enter a stock name".localized()
                }
                
                let saveAction = UIAlertAction(title: "Save".localized(), style: .default, handler: {[weak self] alert -> Void in
                  
                    guard let texfields = ac.textFields else {return}
                    let firstTextField = texfields[0] as UITextField
                    let text = firstTextField.text ?? ""
                    if text.isEmpty {
                       print("New stock name is \(text)")
                    }
                })
                let cancelAction = UIAlertAction(title: "Cancel".localized(), style: .cancel)
                
                ac.addAction(saveAction)
                ac.addAction(cancelAction)
                present(ac, animated: true)
            }else {
                print(TestData.stocks[indexPath.row])
            }
        }
    }
}


