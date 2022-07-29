//
//  UsersViewModel.swift
//  MVVM_JSON_API_00
//
//  Created by Jeen Byun on 7/13/22.
//

import SwiftUI

final class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func fetchUsers(){
        let usersUrlString = "https://jsonplaceholder.typicode.com/users"
        
        if let url = URL(string: usersUrlString) {
            
            URLSession
                .shared
                .dataTask(with: url){ data, response, error in
                    // TODO: Handle returning data on the Main thread
                    if let error = error {
                        //TODO: Handle error
                    } else {
                        
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase // handle properties that look like first_name > firstName
                        
                        if let data = data, // will fail if empty
                           let users = try? decoder.decode([User].self, from: data){
                            // TODO: Handle setting the data
                            self.users = users
                        } else {
                            // TODO: Handle Error
                        }
                    }
                }.resume()
        }
    }
}


//struct UsersViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersViewModel()
//    }
//}
