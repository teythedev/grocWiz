//
//  StocksViewModel.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 17.09.2023.
//

import Foundation

final class StocksViewModel: StocksViewModelProtocol{
    
    weak var delegate: StocksView?
    
    func addNewStockAction(with name: String) {
        print("New stock create with \(name)")
    }
    
    func showMoreStockAction(for stock: Stock) {
        print("Go to detail page for stock of \(stock.title)")
    }
}
