//
//  HttpHeader.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

enum HttpHeader {
    case contentType(value: String? = "application/json")
    case bearerToken(token: String)
    
    var key: String {
        switch self {
        case .contentType:
            return "Content-Type"
        case .bearerToken(_):
            return "Authorization"
        }
    }
    
    var value: String {
        switch self {
        case .contentType(let value):
            return value ?? "application/json"
        case .bearerToken(let token):
            return "Bearer \(token)"
        }
    }
}
