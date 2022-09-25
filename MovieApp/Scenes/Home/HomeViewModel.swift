//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 22.09.2022.
//

import Foundation

final class HomeViewModel: HomeViewModelContracts {
    
    weak var routes: HomeViewModelRoute?
    weak var output: HomeViewModelOutput?
    var repository: MoviesRepositoryContracts
    
    var searchText: String = ""
    var moviesData: [Search]?
    var movieData: Movie?
    
    private var currentPage: Int = 1
    
    init(repository: MoviesRepositoryContracts) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(text: String) {
        if !text.isEmpty {
            self.searchText = text
            fetchMovies(search: text)
        }
    }
    
    func swipeConfigration(search: String) {
        fetchMovieWithPaggination(search: search)
    }
    
    func didSelectRowAt(_ indexPath: IndexPath) {
        let id = moviesData?[indexPath.row].imdbID
        routes?.presentMovieDetail(imdbId: id)
    }
}

// MARK: - DataSources
extension HomeViewModel {
    
    var numberOfRowsInSection: Int {
        return moviesData?.count ?? 0
    }
}

// MARK: - ConfigureContents
extension HomeViewModel {
    
    private func configureCellItem(searchData: [Search]?, isPagination: Bool) {
        guard let searchData = searchData else {
            return
        }
        if isPagination {
            searchData.forEach { item in
                self.moviesData?.append(item)
            }
        } else {
            self.moviesData = searchData
        }
    }
}

// MARK: - Request
extension HomeViewModel {
    
    private func fetchMovies(search: String) {
        output?.showLoadingIndicator(isShow: true)
        self.repository.getMovies(search: search, page: 1) { [weak self] result in
            guard let self = self else { return }
            self.output?.showLoadingIndicator(isShow: false)
            switch result {
            case .success(let response):
                self.configureCellItem(searchData: response.search, isPagination: false)
                self.movieData = response
                self.output?.reloadTableView()
                self.output?.showEmptyData(isShow: response.search?.isEmpty ?? true)
            case .failure(let error):
                self.output?.showMovieError(message: error.localizedDescription)
            }
        }
    }
    
    private func fetchMovieWithPaggination(search: String) {
        guard let totalPage = movieData?.totalResults, currentPage <= Int(totalPage) ?? 0 else { return }
        output?.showBottomLoadingIndicator(isShow: true)
        self.repository.getMovies(search: search, page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.output?.showLoadingIndicator(isShow: false)
            switch result {
            case .success(let response):
                self.currentPage += 1
                self.configureCellItem(searchData: response.search, isPagination: true)
                self.output?.reloadTableView()
                self.output?.showEmptyData(isShow: response.search?.isEmpty ?? true)
            case .failure(let error):
                self.output?.showMovieError(message: error.localizedDescription)
            }
        }
    }
}
