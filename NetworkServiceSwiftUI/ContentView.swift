//
//  ContentView.swift
//  NetworkServiceSwiftUI
//
//  Created by Mustafa Çiçek on 28.08.2022.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    
    init() {
        self.userListViewModel = UserListViewModel(networkService: WebService())
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack {
                Text(user.name ?? "bos")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: Alignment.leading)
                Text(user.userName ?? "bos")
                    .font(.body)
                    .foregroundColor(.gray.opacity(0.75))
                    .frame(maxWidth: .infinity,alignment: Alignment.leading)
                Text(user.email ?? "bos"  )
                    .font(.footnote)
                    .frame(maxWidth: .infinity , alignment: SwiftUI.Alignment.leading)
                
                    
            }
            
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
