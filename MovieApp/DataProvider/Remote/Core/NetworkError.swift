//
//  NetworkError.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case request(statusCode : Int,data : Data?)
    case badRequest
    case decodeError
    case noInternet
    case noResponse
    case responseConvert
    case noData
}
