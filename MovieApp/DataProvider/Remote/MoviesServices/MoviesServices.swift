//
//  MoviesServices.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

final class MoviesServices: MoviesDataSources {
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieMetaData, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: TheOmdbAPI.getMovieDetails(imdbId: imdbId), responseModel: MovieMetaData.self, completion: completion)
    }
    
    func getMovies(search: String, page: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: TheOmdbAPI.getMovies(search: search, page: page), responseModel: Movie.self, completion: completion)
    }
}
