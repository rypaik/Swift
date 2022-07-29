//: [Previous](@previous)

//: Error Checking Added to [MVVM API CLIENT](MVVM%20API%20CLIENT)
//: [JSON API FOR TESTING AND PROTOTYPING](https://jsonplaceholder.typicode.com/)

//: [SwiftUI MVVM API JSON with URLSession](https://www.youtube.com/watch?v=r3O90QGKv98&ab_channel=tundsdev)


//: WORKING till https://youtu.be/r3O90QGKv98?t=1203
//: Finish Error Checking for API Endpoint URL
import Foundation
import SwiftUI

// UserModel.swift
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Codable {
    let name: String
}

// UsersViewModel.swift
final class UsersViewModel: ObservableObject{
    @Published var users: [User] = []
    
    func fetchUsers(){
        
        let usersUrlString = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: usersUrlString){
            URLSession
                .shared
                .dataTask(with: url){ data, response, error in
                        
                    // TODO: Handle returning data on the Main thread
                    if error != nil {
//                    if let error = error {

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


// UserView.swift
struct UserView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading){
            Text("**Name**: \(user.name)")
            Text("**Email**: \(user.email)")
            Divider()
            Text("**Company**: \(user.company.name)")
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView(user: .init(id: 0,
//                             name: "Matthew",
//                             email: "Mslushie@gmail.com",
//                             company: .init(name:"Slushie Inc")))
//    }
//}
// EOF UserView.swift



// ContentView.swift()
struct ContentView: View {
    
    @StateObject private var vm = UsersViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(vm.users, id: \.id){ user in
                        UserView(user: user)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Users")
            }
            .onAppear(perform: vm.fetchUsers)
        }
    }
}


import PlaygroundSupport
PlaygroundPage.current.setLiveView(ContentView())
//struct ContentView_Preview: PreviewProvider {
//    static var preview: some View {
//        ContentView()
//    }
//}
//: [Next](@next)

