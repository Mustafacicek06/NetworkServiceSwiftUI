//
//  UserViewModel.swift
//  NetworkServiceSwiftUI
//
//  Created by Mustafa Çiçek on 28.08.2022.
//

import Foundation


class UserListViewModel: ObservableObject {
    @Published var userList = [UserViewModel]()
    
    //let webService = WebService()
    private var networkService: NetworkService
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func downloadUsers() async {
        var resource = ""
        
        if networkService.type == NetworkTpye.WebService {
            resource = Constants.Urls.userExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        
        
        do {
            let users = try await networkService.download( resource)
            
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }

        } catch {
            
        }
    }
    
}


struct UserViewModel {
    let user: UserModel
    
    var id: Int? {
        user.id
        
    }
    
    var name: String? {
        user.name
    }
    
    var userName: String? {
        user.username
    }
    
    var email: String? {
        user.email
    }
    
}
