//
//  MoviesDetailViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 25.09.2022.
//

import Foundation

final class MoviesDetailViewModel: MovieDetailViewModelContracts {
    var repository: MoviesRepositoryContracts
    var routes: MovieDetailViewModelRoute?
    var output: MovieDetailViewModelOutput?
    var movieData: MovieMetaData?
    
    private let imdbId: String?
    
    init(imdbId: String?, repository: MoviesRepositoryContracts) {
        self.imdbId = imdbId
        self.repository = repository
    }
    
    func viewDidLoad() {
        fetchMovieDetail()
    }
}

// MARK: - DataSources
extension MoviesDetailViewModel {

}

// MARK: - ConfigureContents
extension MoviesDetailViewModel {
    
}


// MARK: - Requests
extension MoviesDetailViewModel {
    
    private func fetchMovieDetail() {
        guard let imdbId = imdbId else { return }
        repository.getMovieDetail(imdbId: imdbId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.movieData = response
                self.output?.notifyResponse(data: response)
            case .failure(let error):
                self.output?.showRequestError(message: error.localizedDescription)
            }
        }
    }
}
