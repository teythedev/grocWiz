//
//  UIView+ext.swift
//  GrocWiz
//
//  Created by Tugay Emre Yucedag on 8.09.2023.
//

import UIKit

extension UIView {
    func roundCornerBy(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func addSubViews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
