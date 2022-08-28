//
//  WebService.swift
//  NetworkServiceSwiftUI
//
//  Created by Mustafa Çiçek on 28.08.2022.
//

import Foundation

enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponse
}

class WebService: NetworkService {
    var type: NetworkTpye {
        return NetworkTpye.WebService
    }
    
    
    func download(_ resource: String) async throws -> [UserModel] {
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
       let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse ,  httpResponse.statusCode <= 300  else {
          
                throw NetworkError.invalidServerResponse
            
        }
        
        return try JSONDecoder().decode([UserModel].self, from: data)
    }
}
