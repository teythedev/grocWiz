//
//  String+ext.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 7.09.2023.
//

import Foundation


extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}


