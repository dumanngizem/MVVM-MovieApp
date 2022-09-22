//
//  SplashViewContracts.swift
//  MovieApp
//
//  Created by Gizem Duman on 22.09.2022.
//

import Foundation

// MARK: - Contracts
protocol SplashViewModelContracts {
    var routes: SplashViewModelRoute? { get set }
    var output: SplashViewModelOutput? { get set }
    
    func viewDidLoad()
    func titleLabelTapped()
}

// MARK: - Routes
protocol SplashViewModelRoute: AnyObject {
    func presentHome()
}

// MARK: - Outputs
protocol SplashViewModelOutput: AnyObject {
    func showInternetError(title: String, message: String)
    func fetchRemoteConfiguration()
}
