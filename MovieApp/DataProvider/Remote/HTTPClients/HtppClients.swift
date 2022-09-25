//
//  HtppClients.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

enum TheOmdbAPI: BasicClientGenerator {
    
    case getMovies(search: String, page: Int)
    case getMovieDetails(imdbId: String)
    
    var scheme: String { "https" }
    
    var host: String { "www.omdbapi.com" }
    
    var path: String {
        switch self {
        case .getMovies:
            return ""
        case .getMovieDetails:
            return ""
        }
    }
    
    var queryItems: [URLQueryItem]?{
        switch self {
        case .getMovies(let search, let page):
            return[
                URLQueryItem(name: "s", value: search),
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "apikey", value: "5d8b9e8c"),
            ]
        case .getMovieDetails(let imdbId):
            return[
                URLQueryItem(name: "i", value: imdbId),
                URLQueryItem(name: "apikey", value: "5d8b9e8c"),
            ]
        default :
            return nil
        }
    }
    
    //MARK: - Default GET
    var method: HttpMethod{
        switch self {
        default:
            return .get
        }
    }
    
    var header: [HttpHeader]? {
        return [
            .contentType(),
        ]
    }
    
    //MARK: - Default Nil
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
