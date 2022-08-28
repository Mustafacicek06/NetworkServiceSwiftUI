//
//  LocalService.swift
//  NetworkServiceSwiftUI
//
//  Created by Mustafa Çiçek on 28.08.2022.
//

import Foundation

class LocalService: NetworkService {
    var type: NetworkTpye {
        return NetworkTpye.LocalService
    }
    
    
    
    func download(_ resource: String) async throws -> [UserModel] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path ))
        
        return try JSONDecoder().decode([UserModel].self, from: data)
    }
}
