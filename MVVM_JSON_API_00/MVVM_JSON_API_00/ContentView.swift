//
//  ContentView.swift
//  MVVM_JSON_API_00
//
//  Created by Jeen Byun on 7/13/22.
//

import SwiftUI
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

//struct ContentView_Preview: PreviewProvider {
//    static var preview: some View {
//        ContentView()
//    }
//}
