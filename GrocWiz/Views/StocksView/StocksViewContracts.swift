//
//  StocksViewContracts.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 17.09.2023.
//

import UIKit

protocol StocksViewModelDelegate: UIViewController {
    
}

protocol StocksViewModelProtocol {
    func addNewStockAction(with name: String)
    func showMoreStockAction(for stock: Stock)
}
