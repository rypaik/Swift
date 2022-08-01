//: [Previous](@previous)

import Foundation
import SwiftUI
 
struct ContentView: View {
    
    @StateObject private var vm = LoginViewModel()
    
    var body: some View {
        switch vm.currentState {
        case .loading:
            ProgressView()
        case .notLoggedIn:
            LoginView(user: $vm.user) {
//                vm.login()
                LoginView(vm: vm)
        }
        case .loggedIn:
            LoggedInView(vm: vm)
        }
    }
}


struct LoginView: View {
    
    @ObservableObject var vm: LoginViewModel
    
    
    let didTap: () -> Void
    
    var body: some View {
        VStack {
            TextField("Username",
                      text: $vm.user.username,
                      prompt: Text("Username?")
            )
            
            SecureField("Password",
                        text: $vm.user.password,
                        prompt: Text("Password"))
            Button {
                didTap()
            } label: {
                Text("Login")
            }
        }
        .padding(.horizontal, 9)
        .textFieldStyle(.roundedBorder)
        .onChange(of: vm.user){ newValue in
            print(" THe user inputted: \(newValue)")
        }
    }
}
//
//struct LoginView_Previews: PreviewProvider {
//    state var previews: some View {
//        LoginView(vm: .init())
//    }
//}


struct LoggedInView: View {
    var body: some View{
        VStack {
            Text("You are not Logged In")
            Button {
                didTap()
            } label: {
                Text("Logout")
    
            }
        }
    }
}

//struct LoggedInView_Previews: PreviewProvider {
//    static var previews: some View{
//        LoggedInView(vm: .init())
//    }
//}

//
//class User: Codeable, Identifiable {
//
//
//
//}


struct ContentView_Previews: PreviewProvider {
    state var previews: some View {
        CurrentView()
    }
}
//: [Next](@next)
