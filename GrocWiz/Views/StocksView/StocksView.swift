//
//  StocksView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 10.09.2023.
//

import UIKit

class StocksView: UIViewController {
    
    var stocksViewModel: StocksViewModelProtocol?
    
    var stocksSearchResult: [Stock] = []

    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let searchBar : UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Please enter a stock name".localized()
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Stocks".localized()
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.hidesNavigationBarDuringPresentation = false
        searchBar.searchBar.tintColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .done, target: self, action:  #selector(addNewStockAction))
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    @objc private func addNewStockAction() {
        let ac = UIAlertController(title: "Add new stock".localized(), message: nil, preferredStyle: .alert)
        
        ac.addTextField { textField in
            textField.placeholder = "Please enter a stock name".localized()
        }
        
        let saveAction = UIAlertAction(title: "Save".localized(), style: .default, handler: {[weak self] alert -> Void in
          
            guard let texfields = ac.textFields else {return}
            let firstTextField = texfields[0] as UITextField
            let text = firstTextField.text ?? ""
            if text.isEmpty {
                self?.stocksViewModel?.addNewStockAction(with: text)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel".localized(), style: .cancel)
        
        ac.addAction(saveAction)
        ac.addAction(cancelAction)
        present(ac, animated: true)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let item1 = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)
            )
        )
        item1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 16, trailing: 8)
        
        
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:
                NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1/5)),
            subitems: [item1])
        
        
        
        let footerHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        
        let background = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        background.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.decorationItems = [background]
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 10
        let layout = UICollectionViewCompositionalLayout(section: section,configuration: config)
        layout.register(BackgroundView.self, forDecorationViewOfKind: "background")
        return layout
    }
    
    private class BackgroundView: UICollectionReusableView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        required init?(coder: NSCoder) {
            fatalError("not implemented")
        }
        
        func configure() {
            roundCornerBy(20)
            backgroundColor = UIColor.secondarySystemBackground
            
        }
    }
}

extension StocksView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searchBar.isActive ? stocksSearchResult.count : TestData.stocks.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemsInSection = 0
        if searchBar.isActive {
            itemsInSection = stocksSearchResult[section].items.count
        }else {
            itemsInSection = TestData.stocks[section].items.count
        }
        if itemsInSection >= 3 {
            return 4
        }else {
            return itemsInSection + 1
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.identifier,
            for: indexPath) as? ItemCollectionViewCell else {return UICollectionViewCell()}
        
        let currentStocks = searchBar.isActive ? stocksSearchResult : TestData.stocks
        
        if (currentStocks[indexPath.section].items.count >= 3 && indexPath.row == 3) ||
            (currentStocks[indexPath.section].items.count == 2 && indexPath.row == 2) ||
            (currentStocks[indexPath.section].items.count == 1 && indexPath.row == 1)
        {
            cell.nameLabel.text = "More".localized()
            
            cell.amountLabel.text = "..."
            
            cell.decreaseButton.isHidden = true
            
            cell.increaseButton.isHidden = true
        }
        else
        {
            cell.nameLabel.text = currentStocks[indexPath.section].items[indexPath.row].name
            
            cell.amountLabel.text = "\(currentStocks[indexPath.section].items[indexPath.row].amount)"
            
            cell.decreaseButton.isHidden = false
            cell.decreaseButtonTapCallback = { [weak self]  in
                TestData.stocks[indexPath.section].items[indexPath.row].amount -= 1
                collectionView.reloadData()
            }
            cell.increaseButton.isHidden = false
            cell.increaseButtonTapCallback = { [weak self]  in
                TestData.stocks[indexPath.section].items[indexPath.row].amount += 1
                collectionView.reloadData()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return searchBar.isActive ? false : true
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderView else {
                return UICollectionReusableView()
            }
            header.headerTitle.text = searchBar.isActive ? stocksSearchResult[indexPath.section].title:  TestData.stocks[indexPath.section].title
            return header
        }
        return UICollectionReusableView()
    }
}

extension StocksView: UISearchResultsUpdating, UISearchBarDelegate {
    func filterContentForSearchText(_ searchText: String) {
        stocksSearchResult = TestData.stocks.filter(
            { (stock:Stock) -> Bool in
                let titleMatch = stock.title.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return titleMatch != nil
            }
        )
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else {return}
        filterContentForSearchText(query)
        collectionView.reloadData()
    }
    
    
}






