//
//  String+Extentions.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

extension String {
    
    var movieURL: URL? {
        let stringUrl = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let stringUrl = stringUrl {
            return URL(string: stringUrl)
        } else {
            return nil
        }
    }
}
