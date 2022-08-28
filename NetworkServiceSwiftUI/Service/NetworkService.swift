//
//  NetworkService.swift
//  NetworkServiceSwiftUI
//
//  Created by Mustafa Çiçek on 28.08.2022.
//

import Foundation

enum NetworkTpye {
    case WebService
    case LocalService
}


protocol NetworkService {
    func download(_ resource: String) async throws -> [UserModel]
    var type: NetworkTpye {get}
}
