//
//  StackView+Extentions.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation
import UIKit

extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
}
