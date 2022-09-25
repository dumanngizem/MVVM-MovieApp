//
//  MoviesRepositoryContracts.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

protocol MoviesRepositoryContracts {
    func getMovies(search: String, page: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void)
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieMetaData, NetworkError>) -> Void)
}
