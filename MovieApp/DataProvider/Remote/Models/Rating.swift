//
//  Rating.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

struct Rating: Decodable {
    
    let source, value: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
