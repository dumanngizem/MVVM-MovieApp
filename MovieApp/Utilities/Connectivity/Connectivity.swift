//
//  Connectivity.swift
//  MovieApp
//
//  Created by Gizem Duman on 22.09.2022.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
