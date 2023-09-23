//
//  Stock.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 16.09.2023.
//

import Foundation

struct Item {
    let name: String
    var amount: Int
}

struct Stock {
    let title: String
    var items: [Item]
}
