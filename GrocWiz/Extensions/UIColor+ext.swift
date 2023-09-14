//
//  UIColor+ext.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 9.09.2023.
//

import UIKit

extension UIColor {
    static func makeTransParent() -> UIColor {
        return UIColor.red.withAlphaComponent(0)
    }
    
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
