//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 22.09.2022.
//

import Foundation

final class SplashViewModel: SplashViewModelContracts {
    
    weak var routes: SplashViewModelRoute?
    weak var output: SplashViewModelOutput?
    
    func viewDidLoad() {
        hasInternet()
    }
    
    func titleLabelTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let self = self else { return }
            self.routes?.presentHome()
        }
    }
}
// MARK: - Request
extension SplashViewModel {
    
    private func hasInternet() {
        if Connectivity.isConnectedToInternet() {
            output?.fetchRemoteConfiguration()
        } else {
            output?.showInternetError(title: "Connection Error", message: "NO INTERNET CONNECTİON!")
        }
    }
}
