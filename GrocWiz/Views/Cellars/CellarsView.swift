//
//  FridgesView.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 10.09.2023.
//

import UIKit

class FridgesView: UIViewController {
    
    var fridges : [Fridge] = [
        Fridge(name: "FriendsHouse", items: [
           
            Item(name: "JdsadsadasdsdafdsfdsfdfsfdsfdsfdsfsdJ", amount: 3),
        ]),
        Fridge(name: "FriendsHouse", items: [
           
            Item(name: "JdsadsadasdsdafdsfdsfdfsfdsfdsfdsfsdJ", amount: 3),
            Item(name: "JdsadsadasdsdafdsfdsfdfsfdsfdsfdsfsdJ", amount: 3),
            Item(name: "JdsadsadasdsdafdsfdsfdfsfdsfdsfdsfsdJ", amount: 3),
        ]),
        Fridge(name: "Home", items: [
            Item(name: "a", amount: 2),
            Item(name: "b", amount: 3),
            Item(name: "c", amount: 4),
            Item(name: "d", amount: 5),
            Item(name: "e", amount: 6),
        ]),
        Fridge(name: "Work", items: [
            Item(name: "ff", amount: 10),
            Item(name: "gg", amount: 11),
            Item(name: "hh", amount: 12),
            Item(name: "ii", amount: 13),
            Item(name: "jj", amount: 14),
            Item(name: "ff", amount: 10),
            Item(name: "gg", amount: 11),
            Item(name: "hh", amount: 12),
            Item(name: "ii", amount: 13),
            Item(name: "jj", amount: 14),
            Item(name: "ff", amount: 10),
            Item(name: "gg", amount: 11),
            Item(name: "hh", amount: 12),
            Item(name: "ii", amount: 13),
            Item(name: "jj", amount: 14),
        ]),
        Fridge(name: "FriendsHouse", items: [
            Item(name: "KKK", amount: 2),
            Item(name: "JJ", amount: 3),
        ]),
    ]
    
    //    lazy var table: UITableView = {
    //        let table = UITableView()
    //        table.translatesAutoresizingMaskIntoConstraints = false
    //        table.delegate = self
    //        table.dataSource = self
    //        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    //        return table
    //    }()
    //
    //
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        view.backgroundColor = .systemBackground
    //        title = "Cellars".localized()
    //        navigationController?.navigationBar.prefersLargeTitles = true
    //        view.addSubview(table)
    //        NSLayoutConstraint.activate([
    //            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    //            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    //            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    //            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    //        ])
    //
    //    }
    //
    //
    //    /*
    //    // MARK: - Navigation
    //
    //    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //    }
    //    */
    //
    //}
    //
    //extension FridgesView:   UITableViewDataSource, UITableViewDelegate {
    //
    //
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        20
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let c = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //        c.textLabel?.text = "COMOMOo"
    //        return c
    //    }
    //
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .systemBackground
       title = "Cellar"
        navigationController?.navigationBar.prefersLargeTitles = true
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let item1 = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)
            )
        )
      item1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 16, trailing: 8)


        
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
        background.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.decorationItems = [background]
       // section.contentInsets = NSDirectionalEdgeInsets(top:0, leading: 8, bottom: 4, trailing: 8)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
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
            backgroundColor = UIColor.secondarySystemBackground
            
        }
    }
}

extension FridgesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        fridges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let x = fridges[section].items.count
        if x > 3 {
            return 8
        }else {
            return x + 1
        }
    
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.identifier,
            for: indexPath) as? ItemCollectionViewCell
        if indexPath.row < fridges[indexPath.section].items.count && indexPath.row < 3 {
            cell?.nameLabel.text = fridges[indexPath.section].items[indexPath.row].name
            cell?.amountLabel.text = "\(fridges[indexPath.section].items[indexPath.row].amount)"
            cell?.decreaseButtonTapCallback = { [weak self]  in
                self!.fridges[indexPath.section].items[indexPath.row].amount -= 1
                collectionView.reloadData()
            }
            cell?.increaseButtonTapCallback = { [weak self]  in
                self!.fridges[indexPath.section].items[indexPath.row].amount += 1
                collectionView.reloadData()
            }
            return cell!
        }
        cell!.nameLabel.text = "more"
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderView
            
            header!.headerTitle.text = fridges[indexPath.section].name
            return header!
            
        }
        return UICollectionReusableView()
    }
    
    
}

struct Item {
    let name: String
    var amount: Int
}

struct Fridge {
    let name: String
    var items: [Item]
}






