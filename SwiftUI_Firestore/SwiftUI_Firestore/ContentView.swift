//
//  SwiftUIView.swift
//  SwiftUI_Firestore
//
//  Created by Jeen Byun on 6/28/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            ListView()
            
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle( .linearGradient(colors: [.pink, .red], startPoint:
                        .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:-350)
            
            VStack(spacing:20){
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size:40, weight: .bold, design: .rounded))
                    .offset(x:-100, y:-100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .offset(y:15)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .font(.system(size:20, weight: .bold, design: .rounded))
                            .offset(y:15)
                            
                    }
                // drawing a line
                Rectangle()
                    .frame(width:350, height:1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .offset(y:15)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .font(.system(size:20, weight: .bold, design: .rounded))
                            .offset(y:15)
                    }
                
                Rectangle()
                    .frame(width:350, height:1)
                    .foregroundColor(.white)
                
                
                Button {
                    register()
                } label:{
                    Text("Sign Up")
                        .bold()
                        .frame(width:200, height: 40)
                        .background(
                            RoundedRectangle( cornerRadius: 10, style: .continuous) .fill(.linearGradient(colors:[.white, .white], startPoint:.top, endPoint: .bottomTrailing))
                                )
                        .foregroundColor(.red)
                    
                }
                Button {
                    login()
                } label: {
                    Text("Login")
                        .bold()
                        .frame(width:200, height: 40)
                        .background(
                            RoundedRectangle( cornerRadius: 10, style: .continuous) .fill(.linearGradient(colors:[.white, .white], startPoint:.top, endPoint: .bottomTrailing))
                                )
                        .foregroundColor(.blue)
                }
                .padding(.top)
                .offset(y:5)
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
