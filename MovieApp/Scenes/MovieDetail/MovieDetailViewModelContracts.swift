//
//  MovieDetailViewModelContracts.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

// MARK: - Contracts
protocol MovieDetailViewModelContracts {
    var routes: MovieDetailViewModelRoute? { get set }
    var output: MovieDetailViewModelOutput? { get set }
    var repository: MoviesRepositoryContracts { get set }
    
    func viewDidLoad()
    
}

// MARK: - Routes
protocol MovieDetailViewModelRoute: AnyObject {
}

//MARK: - Outputs
protocol MovieDetailViewModelOutput: AnyObject {
    func showRequestError(message: String)
    func notifyResponse(data: MovieMetaData?)
}
